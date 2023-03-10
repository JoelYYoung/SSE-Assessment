; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_18.c"
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
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_18_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  br label %source, !dbg !20

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !21), !dbg !22
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !23, metadata !DIExpression()), !dbg !29
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !30
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !32
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !33
  %cmp = icmp ne i8* %call, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !36
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !38
  store i32 %call2, i32* %data, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !43

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !51
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !51
  %3 = load i32, i32* %data, align 4, !dbg !52
  %cmp3 = icmp slt i32 %3, 10, !dbg !54
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !55

if.then4:                                         ; preds = %sink
  %4 = load i32, i32* %data, align 4, !dbg !56
  %idxprom = sext i32 %4 to i64, !dbg !58
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !58
  %5 = load i32, i32* %arrayidx, align 4, !dbg !58
  call void @printIntLine(i32 %5), !dbg !59
  br label %if.end6, !dbg !60

if.else5:                                         ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #4

declare dso_local void @printLine(i8*) #3

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_fgets_18_good() #0 !dbg !64 {
entry:
  call void @goodB2G(), !dbg !65
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE127_Buffer_Underread__CWE839_fgets_18_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__CWE839_fgets_18_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  br label %source, !dbg !91

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !92), !dbg !93
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !97
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !99
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !100
  %cmp = icmp ne i8* %call, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %source
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !103
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !105
  store i32 %call2, i32* %data, align 4, !dbg !106
  br label %if.end, !dbg !107

if.else:                                          ; preds = %source
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sink, !dbg !110

sink:                                             ; preds = %if.end
  call void @llvm.dbg.label(metadata !111), !dbg !112
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !115
  %3 = load i32, i32* %data, align 4, !dbg !116
  %cmp3 = icmp sge i32 %3, 0, !dbg !118
  br i1 %cmp3, label %land.lhs.true, label %if.else6, !dbg !119

land.lhs.true:                                    ; preds = %sink
  %4 = load i32, i32* %data, align 4, !dbg !120
  %cmp4 = icmp slt i32 %4, 10, !dbg !121
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !122

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !123
  %idxprom = sext i32 %5 to i64, !dbg !125
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !125
  %6 = load i32, i32* %arrayidx, align 4, !dbg !125
  call void @printIntLine(i32 %6), !dbg !126
  br label %if.end7, !dbg !127

if.else6:                                         ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !128
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  br label %source, !dbg !135

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !136), !dbg !137
  store i32 7, i32* %data, align 4, !dbg !138
  br label %sink, !dbg !139

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !140), !dbg !141
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !142, metadata !DIExpression()), !dbg !144
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !144
  %1 = load i32, i32* %data, align 4, !dbg !145
  %cmp = icmp slt i32 %1, 10, !dbg !147
  br i1 %cmp, label %if.then, label %if.else, !dbg !148

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !149
  %idxprom = sext i32 %2 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !151
  %3 = load i32, i32* %arrayidx, align 4, !dbg !151
  call void @printIntLine(i32 %3), !dbg !152
  br label %if.end, !dbg !153

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !156
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_18_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fgets_18.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 5, scope: !12)
!21 = !DILabel(scope: !12, name: "source", file: !13, line: 30)
!22 = !DILocation(line: 30, column: 1, scope: !12)
!23 = !DILocalVariable(name: "inputBuffer", scope: !24, file: !13, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !12, file: !13, line: 31, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 112, elements: !27)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !{!28}
!28 = !DISubrange(count: 14)
!29 = !DILocation(line: 32, column: 14, scope: !24)
!30 = !DILocation(line: 34, column: 19, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !13, line: 34, column: 13)
!32 = !DILocation(line: 34, column: 49, scope: !31)
!33 = !DILocation(line: 34, column: 13, scope: !31)
!34 = !DILocation(line: 34, column: 56, scope: !31)
!35 = !DILocation(line: 34, column: 13, scope: !24)
!36 = !DILocation(line: 37, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !13, line: 35, column: 9)
!38 = !DILocation(line: 37, column: 20, scope: !37)
!39 = !DILocation(line: 37, column: 18, scope: !37)
!40 = !DILocation(line: 38, column: 9, scope: !37)
!41 = !DILocation(line: 41, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !31, file: !13, line: 40, column: 9)
!43 = !DILocation(line: 44, column: 5, scope: !12)
!44 = !DILabel(scope: !12, name: "sink", file: !13, line: 45)
!45 = !DILocation(line: 45, column: 1, scope: !12)
!46 = !DILocalVariable(name: "buffer", scope: !47, file: !13, line: 47, type: !48)
!47 = distinct !DILexicalBlock(scope: !12, file: !13, line: 46, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 10)
!51 = !DILocation(line: 47, column: 13, scope: !47)
!52 = !DILocation(line: 50, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !13, line: 50, column: 13)
!54 = !DILocation(line: 50, column: 18, scope: !53)
!55 = !DILocation(line: 50, column: 13, scope: !47)
!56 = !DILocation(line: 52, column: 33, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !13, line: 51, column: 9)
!58 = !DILocation(line: 52, column: 26, scope: !57)
!59 = !DILocation(line: 52, column: 13, scope: !57)
!60 = !DILocation(line: 53, column: 9, scope: !57)
!61 = !DILocation(line: 56, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !53, file: !13, line: 55, column: 9)
!63 = !DILocation(line: 59, column: 1, scope: !12)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fgets_18_good", scope: !13, file: !13, line: 130, type: !14, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 132, column: 5, scope: !64)
!66 = !DILocation(line: 133, column: 5, scope: !64)
!67 = !DILocation(line: 134, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 145, type: !69, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 145, type: !17)
!74 = !DILocation(line: 145, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 145, type: !71)
!76 = !DILocation(line: 145, column: 27, scope: !68)
!77 = !DILocation(line: 148, column: 22, scope: !68)
!78 = !DILocation(line: 148, column: 12, scope: !68)
!79 = !DILocation(line: 148, column: 5, scope: !68)
!80 = !DILocation(line: 150, column: 5, scope: !68)
!81 = !DILocation(line: 151, column: 5, scope: !68)
!82 = !DILocation(line: 152, column: 5, scope: !68)
!83 = !DILocation(line: 155, column: 5, scope: !68)
!84 = !DILocation(line: 156, column: 5, scope: !68)
!85 = !DILocation(line: 157, column: 5, scope: !68)
!86 = !DILocation(line: 159, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 66, type: !14, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 68, type: !17)
!89 = !DILocation(line: 68, column: 9, scope: !87)
!90 = !DILocation(line: 70, column: 10, scope: !87)
!91 = !DILocation(line: 71, column: 5, scope: !87)
!92 = !DILabel(scope: !87, name: "source", file: !13, line: 72)
!93 = !DILocation(line: 72, column: 1, scope: !87)
!94 = !DILocalVariable(name: "inputBuffer", scope: !95, file: !13, line: 74, type: !25)
!95 = distinct !DILexicalBlock(scope: !87, file: !13, line: 73, column: 5)
!96 = !DILocation(line: 74, column: 14, scope: !95)
!97 = !DILocation(line: 76, column: 19, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !13, line: 76, column: 13)
!99 = !DILocation(line: 76, column: 49, scope: !98)
!100 = !DILocation(line: 76, column: 13, scope: !98)
!101 = !DILocation(line: 76, column: 56, scope: !98)
!102 = !DILocation(line: 76, column: 13, scope: !95)
!103 = !DILocation(line: 79, column: 25, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !13, line: 77, column: 9)
!105 = !DILocation(line: 79, column: 20, scope: !104)
!106 = !DILocation(line: 79, column: 18, scope: !104)
!107 = !DILocation(line: 80, column: 9, scope: !104)
!108 = !DILocation(line: 83, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !98, file: !13, line: 82, column: 9)
!110 = !DILocation(line: 86, column: 5, scope: !87)
!111 = !DILabel(scope: !87, name: "sink", file: !13, line: 87)
!112 = !DILocation(line: 87, column: 1, scope: !87)
!113 = !DILocalVariable(name: "buffer", scope: !114, file: !13, line: 89, type: !48)
!114 = distinct !DILexicalBlock(scope: !87, file: !13, line: 88, column: 5)
!115 = !DILocation(line: 89, column: 13, scope: !114)
!116 = !DILocation(line: 91, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !13, line: 91, column: 13)
!118 = !DILocation(line: 91, column: 18, scope: !117)
!119 = !DILocation(line: 91, column: 23, scope: !117)
!120 = !DILocation(line: 91, column: 26, scope: !117)
!121 = !DILocation(line: 91, column: 31, scope: !117)
!122 = !DILocation(line: 91, column: 13, scope: !114)
!123 = !DILocation(line: 93, column: 33, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !13, line: 92, column: 9)
!125 = !DILocation(line: 93, column: 26, scope: !124)
!126 = !DILocation(line: 93, column: 13, scope: !124)
!127 = !DILocation(line: 94, column: 9, scope: !124)
!128 = !DILocation(line: 97, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !13, line: 96, column: 9)
!130 = !DILocation(line: 100, column: 1, scope: !87)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 103, type: !14, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !13, line: 105, type: !17)
!133 = !DILocation(line: 105, column: 9, scope: !131)
!134 = !DILocation(line: 107, column: 10, scope: !131)
!135 = !DILocation(line: 108, column: 5, scope: !131)
!136 = !DILabel(scope: !131, name: "source", file: !13, line: 109)
!137 = !DILocation(line: 109, column: 1, scope: !131)
!138 = !DILocation(line: 112, column: 10, scope: !131)
!139 = !DILocation(line: 113, column: 5, scope: !131)
!140 = !DILabel(scope: !131, name: "sink", file: !13, line: 114)
!141 = !DILocation(line: 114, column: 1, scope: !131)
!142 = !DILocalVariable(name: "buffer", scope: !143, file: !13, line: 116, type: !48)
!143 = distinct !DILexicalBlock(scope: !131, file: !13, line: 115, column: 5)
!144 = !DILocation(line: 116, column: 13, scope: !143)
!145 = !DILocation(line: 119, column: 13, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !13, line: 119, column: 13)
!147 = !DILocation(line: 119, column: 18, scope: !146)
!148 = !DILocation(line: 119, column: 13, scope: !143)
!149 = !DILocation(line: 121, column: 33, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !13, line: 120, column: 9)
!151 = !DILocation(line: 121, column: 26, scope: !150)
!152 = !DILocation(line: 121, column: 13, scope: !150)
!153 = !DILocation(line: 122, column: 9, scope: !150)
!154 = !DILocation(line: 125, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !13, line: 124, column: 9)
!156 = !DILocation(line: 128, column: 1, scope: !131)
