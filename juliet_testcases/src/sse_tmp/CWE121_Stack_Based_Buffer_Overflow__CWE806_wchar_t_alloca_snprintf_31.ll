; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %5, i32** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !37
  store i32* %6, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %8 = load i32*, i32** %data1, align 8, !dbg !45
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !46
  %9 = load i32*, i32** %data1, align 8, !dbg !47
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !48
  %10 = load i32*, i32** %data1, align 8, !dbg !49
  call void @printWLine(i32* %10), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBuffer, align 8, !dbg !79
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  store i32* %2, i32** %data, align 8, !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !85
  %4 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !88, metadata !DIExpression()), !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  store i32* %5, i32** %dataCopy, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !92, metadata !DIExpression()), !dbg !93
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !94
  store i32* %6, i32** %data1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %8 = load i32*, i32** %data1, align 8, !dbg !99
  %call2 = call i64 @wcslen(i32* %8) #7, !dbg !100
  %9 = load i32*, i32** %data1, align 8, !dbg !101
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %9) #6, !dbg !102
  %10 = load i32*, i32** %data1, align 8, !dbg !103
  call void @printWLine(i32* %10), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocation(line: 32, column: 39, scope: !15)
!24 = !DILocation(line: 32, column: 28, scope: !15)
!25 = !DILocation(line: 33, column: 12, scope: !15)
!26 = !DILocation(line: 33, column: 10, scope: !15)
!27 = !DILocation(line: 35, column: 13, scope: !15)
!28 = !DILocation(line: 35, column: 5, scope: !15)
!29 = !DILocation(line: 36, column: 5, scope: !15)
!30 = !DILocation(line: 36, column: 17, scope: !15)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !16, line: 38, type: !4)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!33 = !DILocation(line: 38, column: 19, scope: !32)
!34 = !DILocation(line: 38, column: 30, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !16, line: 39, type: !4)
!36 = !DILocation(line: 39, column: 19, scope: !32)
!37 = !DILocation(line: 39, column: 26, scope: !32)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !16, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !32, file: !16, line: 40, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 21, scope: !39)
!44 = !DILocation(line: 43, column: 22, scope: !39)
!45 = !DILocation(line: 43, column: 35, scope: !39)
!46 = !DILocation(line: 43, column: 28, scope: !39)
!47 = !DILocation(line: 43, column: 49, scope: !39)
!48 = !DILocation(line: 43, column: 13, scope: !39)
!49 = !DILocation(line: 44, column: 24, scope: !39)
!50 = !DILocation(line: 44, column: 13, scope: !39)
!51 = !DILocation(line: 47, column: 1, scope: !15)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_31_good", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 76, column: 5, scope: !52)
!54 = !DILocation(line: 77, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 88, type: !56, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !16, line: 88, type: !7)
!62 = !DILocation(line: 88, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !16, line: 88, type: !58)
!64 = !DILocation(line: 88, column: 27, scope: !55)
!65 = !DILocation(line: 91, column: 22, scope: !55)
!66 = !DILocation(line: 91, column: 12, scope: !55)
!67 = !DILocation(line: 91, column: 5, scope: !55)
!68 = !DILocation(line: 93, column: 5, scope: !55)
!69 = !DILocation(line: 94, column: 5, scope: !55)
!70 = !DILocation(line: 95, column: 5, scope: !55)
!71 = !DILocation(line: 98, column: 5, scope: !55)
!72 = !DILocation(line: 99, column: 5, scope: !55)
!73 = !DILocation(line: 100, column: 5, scope: !55)
!74 = !DILocation(line: 102, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !16, line: 56, type: !4)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !16, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 15, scope: !75)
!80 = !DILocation(line: 57, column: 39, scope: !75)
!81 = !DILocation(line: 57, column: 28, scope: !75)
!82 = !DILocation(line: 58, column: 12, scope: !75)
!83 = !DILocation(line: 58, column: 10, scope: !75)
!84 = !DILocation(line: 60, column: 13, scope: !75)
!85 = !DILocation(line: 60, column: 5, scope: !75)
!86 = !DILocation(line: 61, column: 5, scope: !75)
!87 = !DILocation(line: 61, column: 16, scope: !75)
!88 = !DILocalVariable(name: "dataCopy", scope: !89, file: !16, line: 63, type: !4)
!89 = distinct !DILexicalBlock(scope: !75, file: !16, line: 62, column: 5)
!90 = !DILocation(line: 63, column: 19, scope: !89)
!91 = !DILocation(line: 63, column: 30, scope: !89)
!92 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 64, type: !4)
!93 = !DILocation(line: 64, column: 19, scope: !89)
!94 = !DILocation(line: 64, column: 26, scope: !89)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !16, line: 66, type: !40)
!96 = distinct !DILexicalBlock(scope: !89, file: !16, line: 65, column: 9)
!97 = !DILocation(line: 66, column: 21, scope: !96)
!98 = !DILocation(line: 68, column: 22, scope: !96)
!99 = !DILocation(line: 68, column: 35, scope: !96)
!100 = !DILocation(line: 68, column: 28, scope: !96)
!101 = !DILocation(line: 68, column: 49, scope: !96)
!102 = !DILocation(line: 68, column: 13, scope: !96)
!103 = !DILocation(line: 69, column: 24, scope: !96)
!104 = !DILocation(line: 69, column: 13, scope: !96)
!105 = !DILocation(line: 72, column: 1, scope: !75)
