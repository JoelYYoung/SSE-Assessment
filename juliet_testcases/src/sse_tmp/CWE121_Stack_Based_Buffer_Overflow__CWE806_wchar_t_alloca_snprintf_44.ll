; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  call void %5(i32* %6), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %call = call i64 @wcslen(i32* %1) #7, !dbg !50
  %2 = load i32*, i32** %data.addr, align 8, !dbg !51
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %2) #6, !dbg !52
  %3 = load i32*, i32** %data.addr, align 8, !dbg !53
  call void @printWLine(i32* %3), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !82, metadata !DIExpression()), !dbg !83
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 400, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBuffer, align 8, !dbg !85
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  store i32* %2, i32** %data, align 8, !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  call void %5(i32* %6), !dbg !94
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !103
  %1 = load i32*, i32** %data.addr, align 8, !dbg !104
  %call = call i64 @wcslen(i32* %1) #7, !dbg !105
  %2 = load i32*, i32** %data.addr, align 8, !dbg !106
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.4, i64 0, i64 0), i32* %2) #6, !dbg !107
  %3 = load i32*, i32** %data.addr, align 8, !dbg !108
  call void @printWLine(i32* %3), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_bad", scope: !16, file: !16, line: 39, type: !17, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 41, type: !4)
!20 = !DILocation(line: 41, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 43, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 43, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 44, type: !4)
!27 = !DILocation(line: 44, column: 15, scope: !15)
!28 = !DILocation(line: 44, column: 39, scope: !15)
!29 = !DILocation(line: 44, column: 28, scope: !15)
!30 = !DILocation(line: 45, column: 12, scope: !15)
!31 = !DILocation(line: 45, column: 10, scope: !15)
!32 = !DILocation(line: 47, column: 13, scope: !15)
!33 = !DILocation(line: 47, column: 5, scope: !15)
!34 = !DILocation(line: 48, column: 5, scope: !15)
!35 = !DILocation(line: 48, column: 17, scope: !15)
!36 = !DILocation(line: 50, column: 5, scope: !15)
!37 = !DILocation(line: 50, column: 13, scope: !15)
!38 = !DILocation(line: 51, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 29, type: !23, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !16, line: 29, type: !4)
!41 = !DILocation(line: 29, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 32, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 31, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 32, column: 17, scope: !43)
!48 = !DILocation(line: 34, column: 18, scope: !43)
!49 = !DILocation(line: 34, column: 31, scope: !43)
!50 = !DILocation(line: 34, column: 24, scope: !43)
!51 = !DILocation(line: 34, column: 45, scope: !43)
!52 = !DILocation(line: 34, column: 9, scope: !43)
!53 = !DILocation(line: 35, column: 20, scope: !43)
!54 = !DILocation(line: 35, column: 9, scope: !43)
!55 = !DILocation(line: 37, column: 1, scope: !39)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_44_good", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 82, column: 5, scope: !56)
!58 = !DILocation(line: 83, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !60, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 94, type: !7)
!66 = !DILocation(line: 94, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 94, type: !62)
!68 = !DILocation(line: 94, column: 27, scope: !59)
!69 = !DILocation(line: 97, column: 22, scope: !59)
!70 = !DILocation(line: 97, column: 12, scope: !59)
!71 = !DILocation(line: 97, column: 5, scope: !59)
!72 = !DILocation(line: 99, column: 5, scope: !59)
!73 = !DILocation(line: 100, column: 5, scope: !59)
!74 = !DILocation(line: 101, column: 5, scope: !59)
!75 = !DILocation(line: 104, column: 5, scope: !59)
!76 = !DILocation(line: 105, column: 5, scope: !59)
!77 = !DILocation(line: 106, column: 5, scope: !59)
!78 = !DILocation(line: 108, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 70, type: !4)
!81 = !DILocation(line: 70, column: 15, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !16, line: 71, type: !22)
!83 = !DILocation(line: 71, column: 12, scope: !79)
!84 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !16, line: 72, type: !4)
!85 = !DILocation(line: 72, column: 15, scope: !79)
!86 = !DILocation(line: 72, column: 39, scope: !79)
!87 = !DILocation(line: 72, column: 28, scope: !79)
!88 = !DILocation(line: 73, column: 12, scope: !79)
!89 = !DILocation(line: 73, column: 10, scope: !79)
!90 = !DILocation(line: 75, column: 13, scope: !79)
!91 = !DILocation(line: 75, column: 5, scope: !79)
!92 = !DILocation(line: 76, column: 5, scope: !79)
!93 = !DILocation(line: 76, column: 16, scope: !79)
!94 = !DILocation(line: 77, column: 5, scope: !79)
!95 = !DILocation(line: 77, column: 13, scope: !79)
!96 = !DILocation(line: 78, column: 1, scope: !79)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 58, type: !23, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !16, line: 58, type: !4)
!99 = !DILocation(line: 58, column: 35, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !16, line: 61, type: !44)
!101 = distinct !DILexicalBlock(scope: !97, file: !16, line: 60, column: 5)
!102 = !DILocation(line: 61, column: 17, scope: !101)
!103 = !DILocation(line: 63, column: 18, scope: !101)
!104 = !DILocation(line: 63, column: 31, scope: !101)
!105 = !DILocation(line: 63, column: 24, scope: !101)
!106 = !DILocation(line: 63, column: 45, scope: !101)
!107 = !DILocation(line: 63, column: 9, scope: !101)
!108 = !DILocation(line: 64, column: 20, scope: !101)
!109 = !DILocation(line: 64, column: 9, scope: !101)
!110 = !DILocation(line: 66, column: 1, scope: !97)
