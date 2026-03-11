namespace Profiles.Infrastructure.Mapping
{
    public interface ISingleSourceMap<in TSource, out TTarget>
    {
        TTarget Map(TSource source);
    }
}
