; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_68a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@CWE127_Buffer_Underread__CWE839_fgets_68_badData = dso_local global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__CWE839_fgets_68_goodG2BData = dso_local global i32 0, align 4, !dbg !9
@CWE127_Buffer_Underread__CWE839_fgets_68_goodB2GData = dso_local global i32 0, align 4, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 -1, i32* %data, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !27, metadata !DIExpression()), !dbg !33
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !34
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !36
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !37
  %cmp = icmp ne i8* %call, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !42
  store i32 %call2, i32* %data, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !47
  store i32 %2, i32* @CWE127_Buffer_Underread__CWE839_fgets_68_badData, align 4, !dbg !48
  call void (...) @CWE127_Buffer_Underread__CWE839_fgets_68b_badSink(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_68_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  call void @goodB2G(), !dbg !53
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__CWE839_fgets_68_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__CWE839_fgets_68_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %data, align 4, !dbg !77
  store i32 7, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* %data, align 4, !dbg !79
  store i32 %0, i32* @CWE127_Buffer_Underread__CWE839_fgets_68_goodG2BData, align 4, !dbg !80
  call void (...) @CWE127_Buffer_Underread__CWE839_fgets_68b_goodG2BSink(), !dbg !81
  ret void, !dbg !82
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_68b_goodG2BSink(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !84, metadata !DIExpression()), !dbg !85
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
  %2 = load i32, i32* %data, align 4, !dbg !103
  store i32 %2, i32* @CWE127_Buffer_Underread__CWE839_fgets_68_goodB2GData, align 4, !dbg !104
  call void (...) @CWE127_Buffer_Underread__CWE839_fgets_68b_goodB2GSink(), !dbg !105
  ret void, !dbg !106
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_fgets_68b_goodB2GSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_fgets_68_badData", scope: !2, file: !11, line: 22, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_fgets_68_goodG2BData", scope: !2, file: !11, line: 23, type: !12, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_68a.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_fgets_68_goodB2GData", scope: !2, file: !11, line: 24, type: !12, isLocal: false, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_68_bad", scope: !11, file: !11, line: 31, type: !22, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !11, line: 33, type: !12)
!25 = !DILocation(line: 33, column: 9, scope: !21)
!26 = !DILocation(line: 35, column: 10, scope: !21)
!27 = !DILocalVariable(name: "inputBuffer", scope: !28, file: !11, line: 37, type: !29)
!28 = distinct !DILexicalBlock(scope: !21, file: !11, line: 36, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 112, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 14)
!33 = !DILocation(line: 37, column: 14, scope: !28)
!34 = !DILocation(line: 39, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !11, line: 39, column: 13)
!36 = !DILocation(line: 39, column: 49, scope: !35)
!37 = !DILocation(line: 39, column: 13, scope: !35)
!38 = !DILocation(line: 39, column: 56, scope: !35)
!39 = !DILocation(line: 39, column: 13, scope: !28)
!40 = !DILocation(line: 42, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !11, line: 40, column: 9)
!42 = !DILocation(line: 42, column: 20, scope: !41)
!43 = !DILocation(line: 42, column: 18, scope: !41)
!44 = !DILocation(line: 43, column: 9, scope: !41)
!45 = !DILocation(line: 46, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !11, line: 45, column: 9)
!47 = !DILocation(line: 49, column: 56, scope: !21)
!48 = !DILocation(line: 49, column: 54, scope: !21)
!49 = !DILocation(line: 50, column: 5, scope: !21)
!50 = !DILocation(line: 51, column: 1, scope: !21)
!51 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_68_good", scope: !11, file: !11, line: 97, type: !22, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 112, type: !56, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!12, !12, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !11, line: 112, type: !12)
!61 = !DILocation(line: 112, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !11, line: 112, type: !58)
!63 = !DILocation(line: 112, column: 27, scope: !55)
!64 = !DILocation(line: 115, column: 22, scope: !55)
!65 = !DILocation(line: 115, column: 12, scope: !55)
!66 = !DILocation(line: 115, column: 5, scope: !55)
!67 = !DILocation(line: 117, column: 5, scope: !55)
!68 = !DILocation(line: 118, column: 5, scope: !55)
!69 = !DILocation(line: 119, column: 5, scope: !55)
!70 = !DILocation(line: 122, column: 5, scope: !55)
!71 = !DILocation(line: 123, column: 5, scope: !55)
!72 = !DILocation(line: 124, column: 5, scope: !55)
!73 = !DILocation(line: 126, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !11, line: 64, type: !12)
!76 = !DILocation(line: 64, column: 9, scope: !74)
!77 = !DILocation(line: 66, column: 10, scope: !74)
!78 = !DILocation(line: 69, column: 10, scope: !74)
!79 = !DILocation(line: 70, column: 60, scope: !74)
!80 = !DILocation(line: 70, column: 58, scope: !74)
!81 = !DILocation(line: 71, column: 5, scope: !74)
!82 = !DILocation(line: 72, column: 1, scope: !74)
!83 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 75, type: !22, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !11, line: 77, type: !12)
!85 = !DILocation(line: 77, column: 9, scope: !83)
!86 = !DILocation(line: 79, column: 10, scope: !83)
!87 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !11, line: 81, type: !29)
!88 = distinct !DILexicalBlock(scope: !83, file: !11, line: 80, column: 5)
!89 = !DILocation(line: 81, column: 14, scope: !88)
!90 = !DILocation(line: 83, column: 19, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !11, line: 83, column: 13)
!92 = !DILocation(line: 83, column: 49, scope: !91)
!93 = !DILocation(line: 83, column: 13, scope: !91)
!94 = !DILocation(line: 83, column: 56, scope: !91)
!95 = !DILocation(line: 83, column: 13, scope: !88)
!96 = !DILocation(line: 86, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !11, line: 84, column: 9)
!98 = !DILocation(line: 86, column: 20, scope: !97)
!99 = !DILocation(line: 86, column: 18, scope: !97)
!100 = !DILocation(line: 87, column: 9, scope: !97)
!101 = !DILocation(line: 90, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !91, file: !11, line: 89, column: 9)
!103 = !DILocation(line: 93, column: 60, scope: !83)
!104 = !DILocation(line: 93, column: 58, scope: !83)
!105 = !DILocation(line: 94, column: 5, scope: !83)
!106 = !DILocation(line: 95, column: 1, scope: !83)
