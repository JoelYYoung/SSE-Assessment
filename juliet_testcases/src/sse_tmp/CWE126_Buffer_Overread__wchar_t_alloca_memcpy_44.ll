; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %8, i32** %data, align 8, !dbg !43
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !45
  call void %9(i32* %10), !dbg !44
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !60
  %1 = load i32*, i32** %data.addr, align 8, !dbg !61
  %2 = bitcast i32* %1 to i8*, !dbg !60
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !63
  %mul = mul i64 %call3, 4, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx4, align 4, !dbg !66
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* %arraydecay5), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #6, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #6, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !96, metadata !DIExpression()), !dbg !97
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 200, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 400, align 16, !dbg !104
  %3 = bitcast i8* %2 to i32*, !dbg !105
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !103
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !106
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !107
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !111
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !112
  store i32 0, i32* %arrayidx2, align 4, !dbg !113
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %8, i32** %data, align 8, !dbg !115
  %9 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  call void %9(i32* %10), !dbg !116
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !129
  %1 = load i32*, i32** %data.addr, align 8, !dbg !130
  %2 = bitcast i32* %1 to i8*, !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !131
  %call3 = call i64 @wcslen(i32* %arraydecay2) #7, !dbg !132
  %mul = mul i64 %call3, 4, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx4, align 4, !dbg !135
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  call void @printWLine(i32* %arraydecay5), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 41, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 42, type: !4)
!27 = !DILocation(line: 42, column: 15, scope: !15)
!28 = !DILocation(line: 42, column: 42, scope: !15)
!29 = !DILocation(line: 42, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 43, type: !4)
!31 = !DILocation(line: 43, column: 15, scope: !15)
!32 = !DILocation(line: 43, column: 43, scope: !15)
!33 = !DILocation(line: 43, column: 32, scope: !15)
!34 = !DILocation(line: 44, column: 13, scope: !15)
!35 = !DILocation(line: 44, column: 5, scope: !15)
!36 = !DILocation(line: 45, column: 5, scope: !15)
!37 = !DILocation(line: 45, column: 25, scope: !15)
!38 = !DILocation(line: 46, column: 13, scope: !15)
!39 = !DILocation(line: 46, column: 5, scope: !15)
!40 = !DILocation(line: 47, column: 5, scope: !15)
!41 = !DILocation(line: 47, column: 27, scope: !15)
!42 = !DILocation(line: 49, column: 12, scope: !15)
!43 = !DILocation(line: 49, column: 10, scope: !15)
!44 = !DILocation(line: 51, column: 5, scope: !15)
!45 = !DILocation(line: 51, column: 13, scope: !15)
!46 = !DILocation(line: 52, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !16, line: 23, type: !4)
!49 = !DILocation(line: 23, column: 31, scope: !47)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 26, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !16, line: 25, column: 5)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 26, column: 17, scope: !51)
!56 = !DILocation(line: 27, column: 17, scope: !51)
!57 = !DILocation(line: 27, column: 9, scope: !51)
!58 = !DILocation(line: 28, column: 9, scope: !51)
!59 = !DILocation(line: 28, column: 21, scope: !51)
!60 = !DILocation(line: 31, column: 9, scope: !51)
!61 = !DILocation(line: 31, column: 22, scope: !51)
!62 = !DILocation(line: 31, column: 35, scope: !51)
!63 = !DILocation(line: 31, column: 28, scope: !51)
!64 = !DILocation(line: 31, column: 40, scope: !51)
!65 = !DILocation(line: 32, column: 9, scope: !51)
!66 = !DILocation(line: 32, column: 21, scope: !51)
!67 = !DILocation(line: 33, column: 20, scope: !51)
!68 = !DILocation(line: 33, column: 9, scope: !51)
!69 = !DILocation(line: 35, column: 1, scope: !47)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_44_good", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 90, column: 5, scope: !70)
!72 = !DILocation(line: 91, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 102, type: !74, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!7, !7, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !16, line: 102, type: !7)
!80 = !DILocation(line: 102, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !16, line: 102, type: !76)
!82 = !DILocation(line: 102, column: 27, scope: !73)
!83 = !DILocation(line: 105, column: 22, scope: !73)
!84 = !DILocation(line: 105, column: 12, scope: !73)
!85 = !DILocation(line: 105, column: 5, scope: !73)
!86 = !DILocation(line: 107, column: 5, scope: !73)
!87 = !DILocation(line: 108, column: 5, scope: !73)
!88 = !DILocation(line: 109, column: 5, scope: !73)
!89 = !DILocation(line: 112, column: 5, scope: !73)
!90 = !DILocation(line: 113, column: 5, scope: !73)
!91 = !DILocation(line: 114, column: 5, scope: !73)
!92 = !DILocation(line: 116, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 75, type: !4)
!95 = !DILocation(line: 75, column: 15, scope: !93)
!96 = !DILocalVariable(name: "funcPtr", scope: !93, file: !16, line: 76, type: !22)
!97 = !DILocation(line: 76, column: 12, scope: !93)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !16, line: 77, type: !4)
!99 = !DILocation(line: 77, column: 15, scope: !93)
!100 = !DILocation(line: 77, column: 42, scope: !93)
!101 = !DILocation(line: 77, column: 31, scope: !93)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !16, line: 78, type: !4)
!103 = !DILocation(line: 78, column: 15, scope: !93)
!104 = !DILocation(line: 78, column: 43, scope: !93)
!105 = !DILocation(line: 78, column: 32, scope: !93)
!106 = !DILocation(line: 79, column: 13, scope: !93)
!107 = !DILocation(line: 79, column: 5, scope: !93)
!108 = !DILocation(line: 80, column: 5, scope: !93)
!109 = !DILocation(line: 80, column: 25, scope: !93)
!110 = !DILocation(line: 81, column: 13, scope: !93)
!111 = !DILocation(line: 81, column: 5, scope: !93)
!112 = !DILocation(line: 82, column: 5, scope: !93)
!113 = !DILocation(line: 82, column: 27, scope: !93)
!114 = !DILocation(line: 84, column: 12, scope: !93)
!115 = !DILocation(line: 84, column: 10, scope: !93)
!116 = !DILocation(line: 85, column: 5, scope: !93)
!117 = !DILocation(line: 85, column: 13, scope: !93)
!118 = !DILocation(line: 86, column: 1, scope: !93)
!119 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 59, type: !23, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !16, line: 59, type: !4)
!121 = !DILocation(line: 59, column: 35, scope: !119)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !16, line: 62, type: !52)
!123 = distinct !DILexicalBlock(scope: !119, file: !16, line: 61, column: 5)
!124 = !DILocation(line: 62, column: 17, scope: !123)
!125 = !DILocation(line: 63, column: 17, scope: !123)
!126 = !DILocation(line: 63, column: 9, scope: !123)
!127 = !DILocation(line: 64, column: 9, scope: !123)
!128 = !DILocation(line: 64, column: 21, scope: !123)
!129 = !DILocation(line: 67, column: 9, scope: !123)
!130 = !DILocation(line: 67, column: 22, scope: !123)
!131 = !DILocation(line: 67, column: 35, scope: !123)
!132 = !DILocation(line: 67, column: 28, scope: !123)
!133 = !DILocation(line: 67, column: 40, scope: !123)
!134 = !DILocation(line: 68, column: 9, scope: !123)
!135 = !DILocation(line: 68, column: 21, scope: !123)
!136 = !DILocation(line: 69, column: 20, scope: !123)
!137 = !DILocation(line: 69, column: 9, scope: !123)
!138 = !DILocation(line: 71, column: 1, scope: !119)
