; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %source, !dbg !19

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !20), !dbg !21
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !22
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !23
  br label %sink, !dbg !24

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !25), !dbg !26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !27, metadata !DIExpression()), !dbg !32
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !32
  %2 = load i32, i32* %data, align 4, !dbg !33
  %cmp = icmp sge i32 %2, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.else, !dbg !36

if.then:                                          ; preds = %sink
  %3 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %3 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  %4 = load i32, i32* %arrayidx, align 4, !dbg !39
  call void @printIntLine(i32 %4), !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_18_good() #0 !dbg !45 {
entry:
  call void @goodB2G(), !dbg !46
  call void @goodG2B(), !dbg !47
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
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE129_fscanf_18_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE129_fscanf_18_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %data, align 4, !dbg !72
  br label %source, !dbg !73

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !74), !dbg !75
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !76
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !77
  br label %sink, !dbg !78

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !83
  %2 = load i32, i32* %data, align 4, !dbg !84
  %cmp = icmp sge i32 %2, 0, !dbg !86
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !87

land.lhs.true:                                    ; preds = %sink
  %3 = load i32, i32* %data, align 4, !dbg !88
  %cmp1 = icmp slt i32 %3, 10, !dbg !89
  br i1 %cmp1, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !91
  %idxprom = sext i32 %4 to i64, !dbg !93
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !93
  %5 = load i32, i32* %arrayidx, align 4, !dbg !93
  call void @printIntLine(i32 %5), !dbg !94
  br label %if.end, !dbg !95

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %data, align 4, !dbg !102
  br label %source, !dbg !103

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !104), !dbg !105
  store i32 7, i32* %data, align 4, !dbg !106
  br label %sink, !dbg !107

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !108), !dbg !109
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !110, metadata !DIExpression()), !dbg !112
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !112
  %1 = load i32, i32* %data, align 4, !dbg !113
  %cmp = icmp sge i32 %1, 0, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !117
  %idxprom = sext i32 %2 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  %3 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 %3), !dbg !120
  br label %if.end, !dbg !121

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILabel(scope: !11, name: "source", file: !12, line: 28)
!21 = !DILocation(line: 28, column: 1, scope: !11)
!22 = !DILocation(line: 30, column: 12, scope: !11)
!23 = !DILocation(line: 30, column: 5, scope: !11)
!24 = !DILocation(line: 31, column: 5, scope: !11)
!25 = !DILabel(scope: !11, name: "sink", file: !12, line: 32)
!26 = !DILocation(line: 32, column: 1, scope: !11)
!27 = !DILocalVariable(name: "buffer", scope: !28, file: !12, line: 34, type: !29)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 10)
!32 = !DILocation(line: 34, column: 13, scope: !28)
!33 = !DILocation(line: 37, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !12, line: 37, column: 13)
!35 = !DILocation(line: 37, column: 18, scope: !34)
!36 = !DILocation(line: 37, column: 13, scope: !28)
!37 = !DILocation(line: 39, column: 33, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 38, column: 9)
!39 = !DILocation(line: 39, column: 26, scope: !38)
!40 = !DILocation(line: 39, column: 13, scope: !38)
!41 = !DILocation(line: 40, column: 9, scope: !38)
!42 = !DILocation(line: 43, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !12, line: 42, column: 9)
!44 = !DILocation(line: 46, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_18_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 108, column: 5, scope: !45)
!47 = !DILocation(line: 109, column: 5, scope: !45)
!48 = !DILocation(line: 110, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !50, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!16, !16, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 121, type: !16)
!56 = !DILocation(line: 121, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 121, type: !52)
!58 = !DILocation(line: 121, column: 27, scope: !49)
!59 = !DILocation(line: 124, column: 22, scope: !49)
!60 = !DILocation(line: 124, column: 12, scope: !49)
!61 = !DILocation(line: 124, column: 5, scope: !49)
!62 = !DILocation(line: 126, column: 5, scope: !49)
!63 = !DILocation(line: 127, column: 5, scope: !49)
!64 = !DILocation(line: 128, column: 5, scope: !49)
!65 = !DILocation(line: 131, column: 5, scope: !49)
!66 = !DILocation(line: 132, column: 5, scope: !49)
!67 = !DILocation(line: 133, column: 5, scope: !49)
!68 = !DILocation(line: 135, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 55, type: !16)
!71 = !DILocation(line: 55, column: 9, scope: !69)
!72 = !DILocation(line: 57, column: 10, scope: !69)
!73 = !DILocation(line: 58, column: 5, scope: !69)
!74 = !DILabel(scope: !69, name: "source", file: !12, line: 59)
!75 = !DILocation(line: 59, column: 1, scope: !69)
!76 = !DILocation(line: 61, column: 12, scope: !69)
!77 = !DILocation(line: 61, column: 5, scope: !69)
!78 = !DILocation(line: 62, column: 5, scope: !69)
!79 = !DILabel(scope: !69, name: "sink", file: !12, line: 63)
!80 = !DILocation(line: 63, column: 1, scope: !69)
!81 = !DILocalVariable(name: "buffer", scope: !82, file: !12, line: 65, type: !29)
!82 = distinct !DILexicalBlock(scope: !69, file: !12, line: 64, column: 5)
!83 = !DILocation(line: 65, column: 13, scope: !82)
!84 = !DILocation(line: 67, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 67, column: 13)
!86 = !DILocation(line: 67, column: 18, scope: !85)
!87 = !DILocation(line: 67, column: 23, scope: !85)
!88 = !DILocation(line: 67, column: 26, scope: !85)
!89 = !DILocation(line: 67, column: 31, scope: !85)
!90 = !DILocation(line: 67, column: 13, scope: !82)
!91 = !DILocation(line: 69, column: 33, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !12, line: 68, column: 9)
!93 = !DILocation(line: 69, column: 26, scope: !92)
!94 = !DILocation(line: 69, column: 13, scope: !92)
!95 = !DILocation(line: 70, column: 9, scope: !92)
!96 = !DILocation(line: 73, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !12, line: 72, column: 9)
!98 = !DILocation(line: 76, column: 1, scope: !69)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 81, type: !16)
!101 = !DILocation(line: 81, column: 9, scope: !99)
!102 = !DILocation(line: 83, column: 10, scope: !99)
!103 = !DILocation(line: 84, column: 5, scope: !99)
!104 = !DILabel(scope: !99, name: "source", file: !12, line: 85)
!105 = !DILocation(line: 85, column: 1, scope: !99)
!106 = !DILocation(line: 88, column: 10, scope: !99)
!107 = !DILocation(line: 89, column: 5, scope: !99)
!108 = !DILabel(scope: !99, name: "sink", file: !12, line: 90)
!109 = !DILocation(line: 90, column: 1, scope: !99)
!110 = !DILocalVariable(name: "buffer", scope: !111, file: !12, line: 92, type: !29)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 91, column: 5)
!112 = !DILocation(line: 92, column: 13, scope: !111)
!113 = !DILocation(line: 95, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 95, column: 13)
!115 = !DILocation(line: 95, column: 18, scope: !114)
!116 = !DILocation(line: 95, column: 13, scope: !111)
!117 = !DILocation(line: 97, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !12, line: 96, column: 9)
!119 = !DILocation(line: 97, column: 26, scope: !118)
!120 = !DILocation(line: 97, column: 13, scope: !118)
!121 = !DILocation(line: 98, column: 9, scope: !118)
!122 = !DILocation(line: 101, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !12, line: 100, column: 9)
!124 = !DILocation(line: 104, column: 1, scope: !99)
