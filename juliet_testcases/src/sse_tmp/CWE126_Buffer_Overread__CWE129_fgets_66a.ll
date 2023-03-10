; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_66a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_66a.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_66_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !19, metadata !DIExpression()), !dbg !23
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
  %2 = load i32, i32* %data, align 4, !dbg !45
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !46
  store i32 %2, i32* %arrayidx, align 8, !dbg !47
  %arraydecay3 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !48
  call void @CWE126_Buffer_Overread__CWE129_fgets_66b_badSink(i32* %arraydecay3), !dbg !49
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

declare dso_local void @CWE126_Buffer_Overread__CWE129_fgets_66b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_66_good() #0 !dbg !51 {
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
  call void @CWE126_Buffer_Overread__CWE129_fgets_66_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_fgets_66_bad(), !dbg !71
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
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  store i32 7, i32* %data, align 4, !dbg !80
  %0 = load i32, i32* %data, align 4, !dbg !81
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !82
  store i32 %0, i32* %arrayidx, align 8, !dbg !83
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !84
  call void @CWE126_Buffer_Overread__CWE129_fgets_66b_goodG2BSink(i32* %arraydecay), !dbg !85
  ret void, !dbg !86
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_fgets_66b_goodG2BSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !90, metadata !DIExpression()), !dbg !91
  store i32 -1, i32* %data, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !98
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !99
  %cmp = icmp ne i8* %call, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !104
  store i32 %call2, i32* %data, align 4, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %data, align 4, !dbg !109
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !110
  store i32 %2, i32* %arrayidx, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !112
  call void @CWE126_Buffer_Overread__CWE129_fgets_66b_goodB2GSink(i32* %arraydecay3), !dbg !113
  ret void, !dbg !114
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_fgets_66b_goodB2GSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_66_bad", scope: !13, file: !13, line: 27, type: !14, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_66a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 29, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 29, column: 9, scope: !12)
!19 = !DILocalVariable(name: "dataArray", scope: !12, file: !13, line: 30, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 160, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 5)
!23 = !DILocation(line: 30, column: 9, scope: !12)
!24 = !DILocation(line: 32, column: 10, scope: !12)
!25 = !DILocalVariable(name: "inputBuffer", scope: !26, file: !13, line: 34, type: !27)
!26 = distinct !DILexicalBlock(scope: !12, file: !13, line: 33, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 112, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DILocation(line: 34, column: 14, scope: !26)
!32 = !DILocation(line: 36, column: 19, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !13, line: 36, column: 13)
!34 = !DILocation(line: 36, column: 49, scope: !33)
!35 = !DILocation(line: 36, column: 13, scope: !33)
!36 = !DILocation(line: 36, column: 56, scope: !33)
!37 = !DILocation(line: 36, column: 13, scope: !26)
!38 = !DILocation(line: 39, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !13, line: 37, column: 9)
!40 = !DILocation(line: 39, column: 20, scope: !39)
!41 = !DILocation(line: 39, column: 18, scope: !39)
!42 = !DILocation(line: 40, column: 9, scope: !39)
!43 = !DILocation(line: 43, column: 13, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !13, line: 42, column: 9)
!45 = !DILocation(line: 47, column: 20, scope: !12)
!46 = !DILocation(line: 47, column: 5, scope: !12)
!47 = !DILocation(line: 47, column: 18, scope: !12)
!48 = !DILocation(line: 48, column: 54, scope: !12)
!49 = !DILocation(line: 48, column: 5, scope: !12)
!50 = !DILocation(line: 49, column: 1, scope: !12)
!51 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_66_good", scope: !13, file: !13, line: 97, type: !14, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 112, type: !56, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!17, !17, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !13, line: 112, type: !17)
!61 = !DILocation(line: 112, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !13, line: 112, type: !58)
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
!74 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 58, type: !14, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !13, line: 60, type: !17)
!76 = !DILocation(line: 60, column: 9, scope: !74)
!77 = !DILocalVariable(name: "dataArray", scope: !74, file: !13, line: 61, type: !20)
!78 = !DILocation(line: 61, column: 9, scope: !74)
!79 = !DILocation(line: 63, column: 10, scope: !74)
!80 = !DILocation(line: 66, column: 10, scope: !74)
!81 = !DILocation(line: 67, column: 20, scope: !74)
!82 = !DILocation(line: 67, column: 5, scope: !74)
!83 = !DILocation(line: 67, column: 18, scope: !74)
!84 = !DILocation(line: 68, column: 58, scope: !74)
!85 = !DILocation(line: 68, column: 5, scope: !74)
!86 = !DILocation(line: 69, column: 1, scope: !74)
!87 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 74, type: !14, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 76, type: !17)
!89 = !DILocation(line: 76, column: 9, scope: !87)
!90 = !DILocalVariable(name: "dataArray", scope: !87, file: !13, line: 77, type: !20)
!91 = !DILocation(line: 77, column: 9, scope: !87)
!92 = !DILocation(line: 79, column: 10, scope: !87)
!93 = !DILocalVariable(name: "inputBuffer", scope: !94, file: !13, line: 81, type: !27)
!94 = distinct !DILexicalBlock(scope: !87, file: !13, line: 80, column: 5)
!95 = !DILocation(line: 81, column: 14, scope: !94)
!96 = !DILocation(line: 83, column: 19, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !13, line: 83, column: 13)
!98 = !DILocation(line: 83, column: 49, scope: !97)
!99 = !DILocation(line: 83, column: 13, scope: !97)
!100 = !DILocation(line: 83, column: 56, scope: !97)
!101 = !DILocation(line: 83, column: 13, scope: !94)
!102 = !DILocation(line: 86, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !13, line: 84, column: 9)
!104 = !DILocation(line: 86, column: 20, scope: !103)
!105 = !DILocation(line: 86, column: 18, scope: !103)
!106 = !DILocation(line: 87, column: 9, scope: !103)
!107 = !DILocation(line: 90, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !13, line: 89, column: 9)
!109 = !DILocation(line: 93, column: 20, scope: !87)
!110 = !DILocation(line: 93, column: 5, scope: !87)
!111 = !DILocation(line: 93, column: 18, scope: !87)
!112 = !DILocation(line: 94, column: 58, scope: !87)
!113 = !DILocation(line: 94, column: 5, scope: !87)
!114 = !DILocation(line: 95, column: 1, scope: !87)
