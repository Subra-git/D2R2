using Profiles.Infrastructure.Mapping;

namespace Profiles.Infrastructure.Mapping
{
    public static class ExplicitlyMap
    {
        /// <summary>
        /// Map 1 type to another
        /// </summary>
        /// <typeparam name="TSource">The type to map from</typeparam>
        /// <typeparam name="TTarget">The type to map to</typeparam>
        /// <returns>Single source map builder</returns>
        public static ISingleSourceMapBuilder<TSource, TTarget> TheseTypes<TSource, TTarget>()
        {
            return new SingleSourceMapBuilder<TSource, TTarget>();
        }

        /// <summary>
        /// Map 2 types to 1
        /// </summary>
        /// <typeparam name="TSource1">The first source type</typeparam>
        /// <typeparam name="TSource2">The second source type</typeparam>
        /// <typeparam name="TTarget">The target type</typeparam>
        /// <returns>Double source map builder</returns>
        public static IDoubleSourceMapBuilder<TSource1, TSource2, TTarget> TheseTypes<TSource1, TSource2, TTarget>()
        {
            return new DoubleSourceMapBuilder<TSource1, TSource2, TTarget>();
        }

        /// <summary>
        /// Maps 3 types to 1
        /// </summary>
        /// <typeparam name="TSource1">The first source type</typeparam>
        /// <typeparam name="TSource2">The second source type</typeparam>
        /// <typeparam name="TSource3">The third source type</typeparam>
        /// <typeparam name="TTarget">The target type</typeparam>
        /// <returns>Triple source map builder</returns>
        public static ITripleSourceMapBuilder<TSource1, TSource2, TSource3, TTarget> TheseTypes
            <TSource1, TSource2, TSource3, TTarget>()
        {
            return new TripleSourceMapBuilder<TSource1, TSource2, TSource3, TTarget>();
        }

        /// <summary>
        /// Maps 4 types to 1
        /// </summary>
        /// <typeparam name="TSource1">The first source type</typeparam>
        /// <typeparam name="TSource2">The second source type</typeparam>
        /// <typeparam name="TSource3">The third source type</typeparam>
        /// <typeparam name="TSource4">The fourth source type</typeparam>
        /// <typeparam name="TTarget">The target type</typeparam>
        /// <returns>Quadruple source map builder</returns>
        public static IQuadrupleSourceMapBuilder<TSource1, TSource2, TSource3, TSource4, TTarget> TheseTypes
            <TSource1, TSource2, TSource3, TSource4, TTarget>()
        {
            return new QuadrupleSourceMapBuilder<TSource1, TSource2, TSource3, TSource4, TTarget>();
        }
    }
}
