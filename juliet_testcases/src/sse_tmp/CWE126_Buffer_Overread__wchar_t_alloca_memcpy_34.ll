; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 200, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 400, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !37
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !41
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !42
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  store i32* %8, i32** %data, align 8, !dbg !45
  %9 = load i32*, i32** %data, align 8, !dbg !46
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !47
  store i32* %9, i32** %unionFirst, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !49, metadata !DIExpression()), !dbg !51
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !52
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !52
  store i32* %10, i32** %data3, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !60
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx5, align 4, !dbg !62
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !63
  %12 = load i32*, i32** %data3, align 8, !dbg !64
  %13 = bitcast i32* %12 to i8*, !dbg !63
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !66
  %mul = mul i64 %call8, 4, !dbg !67
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !63
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx9, align 4, !dbg !69
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  call void @printWLine(i32* %arraydecay10), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 200, align 16, !dbg !103
  %1 = bitcast i8* %0 to i32*, !dbg !104
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 400, align 16, !dbg !107
  %3 = bitcast i8* %2 to i32*, !dbg !108
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !106
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !109
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !110
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !113
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !114
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !115
  store i32 0, i32* %arrayidx2, align 4, !dbg !116
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %8, i32** %data, align 8, !dbg !118
  %9 = load i32*, i32** %data, align 8, !dbg !119
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !120
  store i32* %9, i32** %unionFirst, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !122, metadata !DIExpression()), !dbg !124
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !125
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !125
  store i32* %10, i32** %data3, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !130
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !133
  %12 = load i32*, i32** %data3, align 8, !dbg !134
  %13 = bitcast i32* %12 to i8*, !dbg !133
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !136
  %mul = mul i64 %call8, 4, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 4 %13, i64 %mul, i1 false), !dbg !133
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx9, align 4, !dbg !139
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  call void @printWLine(i32* %arraydecay10), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 64, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 42, scope: !15)
!31 = !DILocation(line: 33, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!33 = !DILocation(line: 34, column: 15, scope: !15)
!34 = !DILocation(line: 34, column: 43, scope: !15)
!35 = !DILocation(line: 34, column: 32, scope: !15)
!36 = !DILocation(line: 35, column: 13, scope: !15)
!37 = !DILocation(line: 35, column: 5, scope: !15)
!38 = !DILocation(line: 36, column: 5, scope: !15)
!39 = !DILocation(line: 36, column: 25, scope: !15)
!40 = !DILocation(line: 37, column: 13, scope: !15)
!41 = !DILocation(line: 37, column: 5, scope: !15)
!42 = !DILocation(line: 38, column: 5, scope: !15)
!43 = !DILocation(line: 38, column: 27, scope: !15)
!44 = !DILocation(line: 40, column: 12, scope: !15)
!45 = !DILocation(line: 40, column: 10, scope: !15)
!46 = !DILocation(line: 41, column: 26, scope: !15)
!47 = !DILocation(line: 41, column: 13, scope: !15)
!48 = !DILocation(line: 41, column: 24, scope: !15)
!49 = !DILocalVariable(name: "data", scope: !50, file: !16, line: 43, type: !4)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!51 = !DILocation(line: 43, column: 19, scope: !50)
!52 = !DILocation(line: 43, column: 34, scope: !50)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !16, line: 45, type: !55)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 44, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 45, column: 21, scope: !54)
!59 = !DILocation(line: 46, column: 21, scope: !54)
!60 = !DILocation(line: 46, column: 13, scope: !54)
!61 = !DILocation(line: 47, column: 13, scope: !54)
!62 = !DILocation(line: 47, column: 25, scope: !54)
!63 = !DILocation(line: 50, column: 13, scope: !54)
!64 = !DILocation(line: 50, column: 26, scope: !54)
!65 = !DILocation(line: 50, column: 39, scope: !54)
!66 = !DILocation(line: 50, column: 32, scope: !54)
!67 = !DILocation(line: 50, column: 44, scope: !54)
!68 = !DILocation(line: 51, column: 13, scope: !54)
!69 = !DILocation(line: 51, column: 25, scope: !54)
!70 = !DILocation(line: 52, column: 24, scope: !54)
!71 = !DILocation(line: 52, column: 13, scope: !54)
!72 = !DILocation(line: 55, column: 1, scope: !15)
!73 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good", scope: !16, file: !16, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 92, column: 5, scope: !73)
!75 = !DILocation(line: 93, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 104, type: !77, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!7, !7, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !16, line: 104, type: !7)
!83 = !DILocation(line: 104, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !16, line: 104, type: !79)
!85 = !DILocation(line: 104, column: 27, scope: !76)
!86 = !DILocation(line: 107, column: 22, scope: !76)
!87 = !DILocation(line: 107, column: 12, scope: !76)
!88 = !DILocation(line: 107, column: 5, scope: !76)
!89 = !DILocation(line: 109, column: 5, scope: !76)
!90 = !DILocation(line: 110, column: 5, scope: !76)
!91 = !DILocation(line: 111, column: 5, scope: !76)
!92 = !DILocation(line: 114, column: 5, scope: !76)
!93 = !DILocation(line: 115, column: 5, scope: !76)
!94 = !DILocation(line: 116, column: 5, scope: !76)
!95 = !DILocation(line: 118, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !16, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 15, scope: !96)
!99 = !DILocalVariable(name: "myUnion", scope: !96, file: !16, line: 65, type: !22)
!100 = !DILocation(line: 65, column: 64, scope: !96)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !16, line: 66, type: !4)
!102 = !DILocation(line: 66, column: 15, scope: !96)
!103 = !DILocation(line: 66, column: 42, scope: !96)
!104 = !DILocation(line: 66, column: 31, scope: !96)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !16, line: 67, type: !4)
!106 = !DILocation(line: 67, column: 15, scope: !96)
!107 = !DILocation(line: 67, column: 43, scope: !96)
!108 = !DILocation(line: 67, column: 32, scope: !96)
!109 = !DILocation(line: 68, column: 13, scope: !96)
!110 = !DILocation(line: 68, column: 5, scope: !96)
!111 = !DILocation(line: 69, column: 5, scope: !96)
!112 = !DILocation(line: 69, column: 25, scope: !96)
!113 = !DILocation(line: 70, column: 13, scope: !96)
!114 = !DILocation(line: 70, column: 5, scope: !96)
!115 = !DILocation(line: 71, column: 5, scope: !96)
!116 = !DILocation(line: 71, column: 27, scope: !96)
!117 = !DILocation(line: 73, column: 12, scope: !96)
!118 = !DILocation(line: 73, column: 10, scope: !96)
!119 = !DILocation(line: 74, column: 26, scope: !96)
!120 = !DILocation(line: 74, column: 13, scope: !96)
!121 = !DILocation(line: 74, column: 24, scope: !96)
!122 = !DILocalVariable(name: "data", scope: !123, file: !16, line: 76, type: !4)
!123 = distinct !DILexicalBlock(scope: !96, file: !16, line: 75, column: 5)
!124 = !DILocation(line: 76, column: 19, scope: !123)
!125 = !DILocation(line: 76, column: 34, scope: !123)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !16, line: 78, type: !55)
!127 = distinct !DILexicalBlock(scope: !123, file: !16, line: 77, column: 9)
!128 = !DILocation(line: 78, column: 21, scope: !127)
!129 = !DILocation(line: 79, column: 21, scope: !127)
!130 = !DILocation(line: 79, column: 13, scope: !127)
!131 = !DILocation(line: 80, column: 13, scope: !127)
!132 = !DILocation(line: 80, column: 25, scope: !127)
!133 = !DILocation(line: 83, column: 13, scope: !127)
!134 = !DILocation(line: 83, column: 26, scope: !127)
!135 = !DILocation(line: 83, column: 39, scope: !127)
!136 = !DILocation(line: 83, column: 32, scope: !127)
!137 = !DILocation(line: 83, column: 44, scope: !127)
!138 = !DILocation(line: 84, column: 13, scope: !127)
!139 = !DILocation(line: 84, column: 25, scope: !127)
!140 = !DILocation(line: 85, column: 24, scope: !127)
!141 = !DILocation(line: 85, column: 13, scope: !127)
!142 = !DILocation(line: 88, column: 1, scope: !96)
