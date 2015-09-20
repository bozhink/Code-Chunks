// Some complex arithmethmetics
#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllexport) struct dComplex { double repart; double impart; } ;

__declspec(dllexport) struct dComplex __cdecl AddComplex(struct dComplex a, struct dComplex b)
{
    struct dComplex result;
    result.repart = a.repart + b.repart;
    result.impart = a.impart + b.impart;
    return result;
}

#ifdef __cplusplus
}
#endif
