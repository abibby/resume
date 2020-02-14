
type Union<T> = T extends Array<infer U> ? U : never
// type Union<T extends any[], U = never> = T[number] | U

type ResultArray = Array<string | Builder<ResultArray, string>>

interface Builder<S extends ResultArray, K extends string> {
    key: K
    result: S
}



type Result<S extends ResultArray> = {
    [
    K in S extends Array<infer U>
    ? (U extends Builder<infer R, infer BK> ? U['key'] : U)
    : never
    ]: string
}

function select<S extends ResultArray, K extends string>(name: K, ...selects: S): Builder<S, K> {
    return {
        key: name,
        result: selects,
    }
}

function build<S extends ResultArray>(builder: Builder<S, string>): Result<S> {
    const ret: Partial<Result<S>> = {}
    for (const select of builder.result) {
        if (typeof select === 'string') {
            ret[select] = 'normal-select'
        } else {
            ret[select.key] = build(select)
        }
    }

    return ret as Result<S>
}

const foo = build(select('foo', 'a', 'b', select('bar', 'c', 'd', select('baz', 'e', 'f'))))

console.log(foo, foo.bar)
// console.log(foo, foo.bar.baz)