; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_65a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_65_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32)* @CWE127_Buffer_Underread__CWE839_fgets_65b_badSink, void (i32)** %funcPtr, align 8, !dbg !23
  store i32 -1, i32* %data, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !25, metadata !DIExpression()), !dbg !31
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !31
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !32
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !34
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !35
  %cmp = icmp ne i8* %call, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !40
  store i32 %call2, i32* %data, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !45
  %3 = load i32, i32* %data, align 4, !dbg !46
  call void %2(i32 %3), !dbg !45
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_65b_badSink(i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_65_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  call void @goodB2G(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE127_Buffer_Underread__CWE839_fgets_65_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__CWE839_fgets_65_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !74, metadata !DIExpression()), !dbg !75
  store void (i32)* @CWE127_Buffer_Underread__CWE839_fgets_65b_goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !75
  store i32 -1, i32* %data, align 4, !dbg !76
  store i32 7, i32* %data, align 4, !dbg !77
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !78
  %1 = load i32, i32* %data, align 4, !dbg !79
  call void %0(i32 %1), !dbg !78
  ret void, !dbg !80
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_65b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i32)* @CWE127_Buffer_Underread__CWE839_fgets_65b_goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !85
  store i32 -1, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !90
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !92
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !93
  %cmp = icmp ne i8* %call, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !98
  store i32 %call2, i32* %data, align 4, !dbg !99
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !103
  %3 = load i32, i32* %data, align 4, !dbg !104
  call void %2(i32 %3), !dbg !103
  ret void, !dbg !105
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_65b_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_65_bad", scope: !13, file: !13, line: 27, type: !14, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_65a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 29, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 29, column: 9, scope: !12)
!19 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !17}
!23 = !DILocation(line: 31, column: 12, scope: !12)
!24 = !DILocation(line: 33, column: 10, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 35, type: !27)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 34, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 35, column: 14, scope: !26)
!32 = !DILocation(line: 37, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !13, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 49, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !33)
!36 = !DILocation(line: 37, column: 56, scope: !33)
!37 = !DILocation(line: 37, column: 13, scope: !26)
!38 = !DILocation(line: 40, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 38, column: 9)
!40 = !DILocation(line: 40, column: 20, scope: !39)
!41 = !DILocation(line: 40, column: 18, scope: !39)
!42 = !DILocation(line: 41, column: 9, scope: !39)
!43 = !DILocation(line: 44, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 43, column: 9)
!45 = !DILocation(line: 48, column: 5, scope: !12)
!46 = !DILocation(line: 48, column: 13, scope: !12)
!47 = !DILocation(line: 49, column: 1, scope: !12)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_65_good", scope: !13, file: !13, line: 95, type: !14, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 97, column: 5, scope: !48)
!50 = !DILocation(line: 98, column: 5, scope: !48)
!51 = !DILocation(line: 99, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 110, type: !53, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!17, !17, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !13, line: 110, type: !17)
!58 = !DILocation(line: 110, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !13, line: 110, type: !55)
!60 = !DILocation(line: 110, column: 27, scope: !52)
!61 = !DILocation(line: 113, column: 22, scope: !52)
!62 = !DILocation(line: 113, column: 12, scope: !52)
!63 = !DILocation(line: 113, column: 5, scope: !52)
!64 = !DILocation(line: 115, column: 5, scope: !52)
!65 = !DILocation(line: 116, column: 5, scope: !52)
!66 = !DILocation(line: 117, column: 5, scope: !52)
!67 = !DILocation(line: 120, column: 5, scope: !52)
!68 = !DILocation(line: 121, column: 5, scope: !52)
!69 = !DILocation(line: 122, column: 5, scope: !52)
!70 = !DILocation(line: 124, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 58, type: !14, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !13, line: 60, type: !17)
!73 = !DILocation(line: 60, column: 9, scope: !71)
!74 = !DILocalVariable(name: "funcPtr", scope: !71, file: !13, line: 61, type: !20)
!75 = !DILocation(line: 61, column: 12, scope: !71)
!76 = !DILocation(line: 63, column: 10, scope: !71)
!77 = !DILocation(line: 66, column: 10, scope: !71)
!78 = !DILocation(line: 67, column: 5, scope: !71)
!79 = !DILocation(line: 67, column: 13, scope: !71)
!80 = !DILocation(line: 68, column: 1, scope: !71)
!81 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 75, type: !17)
!83 = !DILocation(line: 75, column: 9, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !13, line: 76, type: !20)
!85 = !DILocation(line: 76, column: 12, scope: !81)
!86 = !DILocation(line: 78, column: 10, scope: !81)
!87 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !13, line: 80, type: !27)
!88 = distinct !DILexicalBlock(scope: !81, file: !13, line: 79, column: 5)
!89 = !DILocation(line: 80, column: 14, scope: !88)
!90 = !DILocation(line: 82, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 82, column: 13)
!92 = !DILocation(line: 82, column: 49, scope: !91)
!93 = !DILocation(line: 82, column: 13, scope: !91)
!94 = !DILocation(line: 82, column: 56, scope: !91)
!95 = !DILocation(line: 82, column: 13, scope: !88)
!96 = !DILocation(line: 85, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !13, line: 83, column: 9)
!98 = !DILocation(line: 85, column: 20, scope: !97)
!99 = !DILocation(line: 85, column: 18, scope: !97)
!100 = !DILocation(line: 86, column: 9, scope: !97)
!101 = !DILocation(line: 89, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !91, file: !13, line: 88, column: 9)
!103 = !DILocation(line: 92, column: 5, scope: !81)
!104 = !DILocation(line: 92, column: 13, scope: !81)
!105 = !DILocation(line: 93, column: 1, scope: !81)
