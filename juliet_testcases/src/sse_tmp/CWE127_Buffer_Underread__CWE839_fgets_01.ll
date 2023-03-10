; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_01_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !20, metadata !DIExpression()), !dbg !26
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !27
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !30
  %cmp = icmp ne i8* %call, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !33
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !35
  store i32 %call2, i32* %data, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !45
  %3 = load i32, i32* %data, align 4, !dbg !46
  %cmp3 = icmp slt i32 %3, 10, !dbg !48
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !49

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !50
  %idxprom = sext i32 %4 to i64, !dbg !52
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !52
  %5 = load i32, i32* %arrayidx, align 4, !dbg !52
  call void @printIntLine(i32 %5), !dbg !53
  br label %if.end6, !dbg !54

if.else5:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_01_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  call void @goodB2G(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__CWE839_fgets_01_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__CWE839_fgets_01_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  store i32 7, i32* %data, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !86, metadata !DIExpression()), !dbg !88
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !88
  %1 = load i32, i32* %data, align 4, !dbg !89
  %cmp = icmp slt i32 %1, 10, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !93
  %idxprom = sext i32 %2 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !95
  %3 = load i32, i32* %arrayidx, align 4, !dbg !95
  call void @printIntLine(i32 %3), !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !101 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %data, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !108
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !110
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !111
  %cmp = icmp ne i8* %call, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !116
  store i32 %call2, i32* %data, align 4, !dbg !117
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !123
  %3 = load i32, i32* %data, align 4, !dbg !124
  %cmp3 = icmp sge i32 %3, 0, !dbg !126
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !127

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* %data, align 4, !dbg !128
  %cmp4 = icmp slt i32 %4, 10, !dbg !129
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !130

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !131
  %idxprom = sext i32 %5 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !133
  %6 = load i32, i32* %arrayidx, align 4, !dbg !133
  call void @printIntLine(i32 %6), !dbg !134
  br label %if.end7, !dbg !135

if.else6:                                         ; preds = %land.lhs.true, %if.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !136
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !138
}

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_01_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_01.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocalVariable(name: "inputBuffer", scope: !21, file: !13, line: 30, type: !22)
!21 = distinct !DILexicalBlock(scope: !12, file: !13, line: 29, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DILocation(line: 30, column: 14, scope: !21)
!27 = !DILocation(line: 32, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 32, column: 13)
!29 = !DILocation(line: 32, column: 49, scope: !28)
!30 = !DILocation(line: 32, column: 13, scope: !28)
!31 = !DILocation(line: 32, column: 56, scope: !28)
!32 = !DILocation(line: 32, column: 13, scope: !21)
!33 = !DILocation(line: 35, column: 25, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !13, line: 33, column: 9)
!35 = !DILocation(line: 35, column: 20, scope: !34)
!36 = !DILocation(line: 35, column: 18, scope: !34)
!37 = !DILocation(line: 36, column: 9, scope: !34)
!38 = !DILocation(line: 39, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !13, line: 38, column: 9)
!40 = !DILocalVariable(name: "buffer", scope: !41, file: !13, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !12, file: !13, line: 42, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 10)
!45 = !DILocation(line: 43, column: 13, scope: !41)
!46 = !DILocation(line: 46, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !13, line: 46, column: 13)
!48 = !DILocation(line: 46, column: 18, scope: !47)
!49 = !DILocation(line: 46, column: 13, scope: !41)
!50 = !DILocation(line: 48, column: 33, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !13, line: 47, column: 9)
!52 = !DILocation(line: 48, column: 26, scope: !51)
!53 = !DILocation(line: 48, column: 13, scope: !51)
!54 = !DILocation(line: 49, column: 9, scope: !51)
!55 = !DILocation(line: 52, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !47, file: !13, line: 51, column: 9)
!57 = !DILocation(line: 55, column: 1, scope: !12)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_01_good", scope: !13, file: !13, line: 118, type: !14, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 120, column: 5, scope: !58)
!60 = !DILocation(line: 121, column: 5, scope: !58)
!61 = !DILocation(line: 122, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 133, type: !63, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!17, !17, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !13, line: 133, type: !17)
!68 = !DILocation(line: 133, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !13, line: 133, type: !65)
!70 = !DILocation(line: 133, column: 27, scope: !62)
!71 = !DILocation(line: 136, column: 22, scope: !62)
!72 = !DILocation(line: 136, column: 12, scope: !62)
!73 = !DILocation(line: 136, column: 5, scope: !62)
!74 = !DILocation(line: 138, column: 5, scope: !62)
!75 = !DILocation(line: 139, column: 5, scope: !62)
!76 = !DILocation(line: 140, column: 5, scope: !62)
!77 = !DILocation(line: 143, column: 5, scope: !62)
!78 = !DILocation(line: 144, column: 5, scope: !62)
!79 = !DILocation(line: 145, column: 5, scope: !62)
!80 = !DILocation(line: 147, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 62, type: !14, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 64, type: !17)
!83 = !DILocation(line: 64, column: 9, scope: !81)
!84 = !DILocation(line: 66, column: 10, scope: !81)
!85 = !DILocation(line: 69, column: 10, scope: !81)
!86 = !DILocalVariable(name: "buffer", scope: !87, file: !13, line: 71, type: !42)
!87 = distinct !DILexicalBlock(scope: !81, file: !13, line: 70, column: 5)
!88 = !DILocation(line: 71, column: 13, scope: !87)
!89 = !DILocation(line: 74, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !13, line: 74, column: 13)
!91 = !DILocation(line: 74, column: 18, scope: !90)
!92 = !DILocation(line: 74, column: 13, scope: !87)
!93 = !DILocation(line: 76, column: 33, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !13, line: 75, column: 9)
!95 = !DILocation(line: 76, column: 26, scope: !94)
!96 = !DILocation(line: 76, column: 13, scope: !94)
!97 = !DILocation(line: 77, column: 9, scope: !94)
!98 = !DILocation(line: 80, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !90, file: !13, line: 79, column: 9)
!100 = !DILocation(line: 83, column: 1, scope: !81)
!101 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 86, type: !14, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !13, line: 88, type: !17)
!103 = !DILocation(line: 88, column: 9, scope: !101)
!104 = !DILocation(line: 90, column: 10, scope: !101)
!105 = !DILocalVariable(name: "inputBuffer", scope: !106, file: !13, line: 92, type: !22)
!106 = distinct !DILexicalBlock(scope: !101, file: !13, line: 91, column: 5)
!107 = !DILocation(line: 92, column: 14, scope: !106)
!108 = !DILocation(line: 94, column: 19, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !13, line: 94, column: 13)
!110 = !DILocation(line: 94, column: 49, scope: !109)
!111 = !DILocation(line: 94, column: 13, scope: !109)
!112 = !DILocation(line: 94, column: 56, scope: !109)
!113 = !DILocation(line: 94, column: 13, scope: !106)
!114 = !DILocation(line: 97, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !13, line: 95, column: 9)
!116 = !DILocation(line: 97, column: 20, scope: !115)
!117 = !DILocation(line: 97, column: 18, scope: !115)
!118 = !DILocation(line: 98, column: 9, scope: !115)
!119 = !DILocation(line: 101, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !109, file: !13, line: 100, column: 9)
!121 = !DILocalVariable(name: "buffer", scope: !122, file: !13, line: 105, type: !42)
!122 = distinct !DILexicalBlock(scope: !101, file: !13, line: 104, column: 5)
!123 = !DILocation(line: 105, column: 13, scope: !122)
!124 = !DILocation(line: 107, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !13, line: 107, column: 13)
!126 = !DILocation(line: 107, column: 18, scope: !125)
!127 = !DILocation(line: 107, column: 23, scope: !125)
!128 = !DILocation(line: 107, column: 26, scope: !125)
!129 = !DILocation(line: 107, column: 31, scope: !125)
!130 = !DILocation(line: 107, column: 13, scope: !122)
!131 = !DILocation(line: 109, column: 33, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !13, line: 108, column: 9)
!133 = !DILocation(line: 109, column: 26, scope: !132)
!134 = !DILocation(line: 109, column: 13, scope: !132)
!135 = !DILocation(line: 110, column: 9, scope: !132)
!136 = !DILocation(line: 113, column: 13, scope: !137)
!137 = distinct !DILexicalBlock(scope: !125, file: !13, line: 112, column: 9)
!138 = !DILocation(line: 116, column: 1, scope: !101)
