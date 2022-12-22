; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !39
  %7 = load i32*, i32** %data, align 8, !dbg !40
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* %8), !dbg !43
  ret void, !dbg !44
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 400, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %dataBuffer, align 8, !dbg !73
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %2, i32** %data, align 8, !dbg !77
  %3 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !79
  %4 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !84
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !85
  %6 = load i32*, i32** %data, align 8, !dbg !86
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !87
  %7 = load i32*, i32** %data, align 8, !dbg !88
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !89
  %8 = load i32*, i32** %data, align 8, !dbg !90
  call void @printWLine(i32* %8), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %2, i32** %data, align 8, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %call1 = call i64 @wcslen(i32* %6) #7, !dbg !111
  %7 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %7) #6, !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %8), !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15.c", directory: "/root/SSE-Assessment")
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
!27 = !DILocation(line: 38, column: 17, scope: !15)
!28 = !DILocation(line: 38, column: 9, scope: !15)
!29 = !DILocation(line: 39, column: 9, scope: !15)
!30 = !DILocation(line: 39, column: 21, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !16, line: 47, type: !33)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 47, column: 17, scope: !32)
!37 = !DILocation(line: 49, column: 18, scope: !32)
!38 = !DILocation(line: 49, column: 31, scope: !32)
!39 = !DILocation(line: 49, column: 24, scope: !32)
!40 = !DILocation(line: 49, column: 45, scope: !32)
!41 = !DILocation(line: 49, column: 9, scope: !32)
!42 = !DILocation(line: 50, column: 20, scope: !32)
!43 = !DILocation(line: 50, column: 9, scope: !32)
!44 = !DILocation(line: 52, column: 1, scope: !15)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_15_good", scope: !16, file: !16, line: 110, type: !17, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 112, column: 5, scope: !45)
!47 = !DILocation(line: 113, column: 5, scope: !45)
!48 = !DILocation(line: 114, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 126, type: !50, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!7, !7, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !16, line: 126, type: !7)
!56 = !DILocation(line: 126, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !16, line: 126, type: !52)
!58 = !DILocation(line: 126, column: 27, scope: !49)
!59 = !DILocation(line: 129, column: 22, scope: !49)
!60 = !DILocation(line: 129, column: 12, scope: !49)
!61 = !DILocation(line: 129, column: 5, scope: !49)
!62 = !DILocation(line: 131, column: 5, scope: !49)
!63 = !DILocation(line: 132, column: 5, scope: !49)
!64 = !DILocation(line: 133, column: 5, scope: !49)
!65 = !DILocation(line: 136, column: 5, scope: !49)
!66 = !DILocation(line: 137, column: 5, scope: !49)
!67 = !DILocation(line: 138, column: 5, scope: !49)
!68 = !DILocation(line: 140, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 61, type: !4)
!71 = !DILocation(line: 61, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !16, line: 62, type: !4)
!73 = !DILocation(line: 62, column: 15, scope: !69)
!74 = !DILocation(line: 62, column: 39, scope: !69)
!75 = !DILocation(line: 62, column: 28, scope: !69)
!76 = !DILocation(line: 63, column: 12, scope: !69)
!77 = !DILocation(line: 63, column: 10, scope: !69)
!78 = !DILocation(line: 72, column: 17, scope: !69)
!79 = !DILocation(line: 72, column: 9, scope: !69)
!80 = !DILocation(line: 73, column: 9, scope: !69)
!81 = !DILocation(line: 73, column: 20, scope: !69)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !16, line: 77, type: !33)
!83 = distinct !DILexicalBlock(scope: !69, file: !16, line: 76, column: 5)
!84 = !DILocation(line: 77, column: 17, scope: !83)
!85 = !DILocation(line: 79, column: 18, scope: !83)
!86 = !DILocation(line: 79, column: 31, scope: !83)
!87 = !DILocation(line: 79, column: 24, scope: !83)
!88 = !DILocation(line: 79, column: 45, scope: !83)
!89 = !DILocation(line: 79, column: 9, scope: !83)
!90 = !DILocation(line: 80, column: 20, scope: !83)
!91 = !DILocation(line: 80, column: 9, scope: !83)
!92 = !DILocation(line: 82, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 87, type: !4)
!95 = !DILocation(line: 87, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !16, line: 88, type: !4)
!97 = !DILocation(line: 88, column: 15, scope: !93)
!98 = !DILocation(line: 88, column: 39, scope: !93)
!99 = !DILocation(line: 88, column: 28, scope: !93)
!100 = !DILocation(line: 89, column: 12, scope: !93)
!101 = !DILocation(line: 89, column: 10, scope: !93)
!102 = !DILocation(line: 94, column: 17, scope: !93)
!103 = !DILocation(line: 94, column: 9, scope: !93)
!104 = !DILocation(line: 95, column: 9, scope: !93)
!105 = !DILocation(line: 95, column: 20, scope: !93)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !16, line: 103, type: !33)
!107 = distinct !DILexicalBlock(scope: !93, file: !16, line: 102, column: 5)
!108 = !DILocation(line: 103, column: 17, scope: !107)
!109 = !DILocation(line: 105, column: 18, scope: !107)
!110 = !DILocation(line: 105, column: 31, scope: !107)
!111 = !DILocation(line: 105, column: 24, scope: !107)
!112 = !DILocation(line: 105, column: 45, scope: !107)
!113 = !DILocation(line: 105, column: 9, scope: !107)
!114 = !DILocation(line: 106, column: 20, scope: !107)
!115 = !DILocation(line: 106, column: 9, scope: !107)
!116 = !DILocation(line: 108, column: 1, scope: !93)
