; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"fgets() failed.\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_16_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !18
  store i32 -1, i32* %data, align 4, !dbg !19
  br label %while.body, !dbg !20

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !21, metadata !DIExpression()), !dbg !28
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !29
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !31
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !32
  %cmp = icmp ne i8* %call, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !37
  store i32 %call2, i32* %data, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !40
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !42

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !43

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !44, metadata !DIExpression()), !dbg !50
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !50
  %3 = load i32, i32* %data, align 4, !dbg !51
  %cmp4 = icmp sge i32 %3, 0, !dbg !53
  br i1 %cmp4, label %if.then5, label %if.else6, !dbg !54

if.then5:                                         ; preds = %while.body3
  %4 = load i32, i32* %data, align 4, !dbg !55
  %idxprom = sext i32 %4 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  %5 = load i32, i32* %arrayidx, align 4, !dbg !57
  call void @printIntLine(i32 %5), !dbg !58
  br label %if.end7, !dbg !59

if.else6:                                         ; preds = %while.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  br label %while.end8, !dbg !62

while.end8:                                       ; preds = %if.end7
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__CWE129_fgets_16_good() #0 !dbg !64 {
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
  call void @CWE126_Buffer_Overread__CWE129_fgets_16_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__CWE129_fgets_16_bad(), !dbg !84
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
  br label %while.body, !dbg !91

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %0 = bitcast [14 x i8]* %inputBuffer to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 14, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !98
  %call = call i8* @fgets(i8* %arraydecay, i32 14, %struct._IO_FILE* %1), !dbg !99
  %cmp = icmp ne i8* %call, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %while.body
  %arraydecay1 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32 @atoi(i8* %arraydecay1) #6, !dbg !104
  store i32 %call2, i32* %data, align 4, !dbg !105
  br label %if.end, !dbg !106

if.else:                                          ; preds = %while.body
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end, !dbg !109

while.end:                                        ; preds = %if.end
  br label %while.body3, !dbg !110

while.body3:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !111, metadata !DIExpression()), !dbg !114
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !114
  %3 = load i32, i32* %data, align 4, !dbg !115
  %cmp4 = icmp sge i32 %3, 0, !dbg !117
  br i1 %cmp4, label %land.lhs.true, label %if.else7, !dbg !118

land.lhs.true:                                    ; preds = %while.body3
  %4 = load i32, i32* %data, align 4, !dbg !119
  %cmp5 = icmp slt i32 %4, 10, !dbg !120
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !121

if.then6:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %data, align 4, !dbg !122
  %idxprom = sext i32 %5 to i64, !dbg !124
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !124
  %6 = load i32, i32* %arrayidx, align 4, !dbg !124
  call void @printIntLine(i32 %6), !dbg !125
  br label %if.end8, !dbg !126

if.else7:                                         ; preds = %land.lhs.true, %while.body3
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !127
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  br label %while.end9, !dbg !129

while.end9:                                       ; preds = %if.end8
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !132, metadata !DIExpression()), !dbg !133
  store i32 -1, i32* %data, align 4, !dbg !134
  br label %while.body, !dbg !135

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !136
  br label %while.end, !dbg !138

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !139

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !140, metadata !DIExpression()), !dbg !143
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !143
  %1 = load i32, i32* %data, align 4, !dbg !144
  %cmp = icmp sge i32 %1, 0, !dbg !146
  br i1 %cmp, label %if.then, label %if.else, !dbg !147

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !148
  %idxprom = sext i32 %2 to i64, !dbg !150
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !150
  %3 = load i32, i32* %arrayidx, align 4, !dbg !150
  call void @printIntLine(i32 %3), !dbg !151
  br label %if.end, !dbg !152

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !155

while.end2:                                       ; preds = %if.end
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_16.c", directory: "/root/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_16_bad", scope: !13, file: !13, line: 24, type: !14, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fgets_16.c", directory: "/root/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 26, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 9, scope: !12)
!19 = !DILocation(line: 28, column: 10, scope: !12)
!20 = !DILocation(line: 29, column: 5, scope: !12)
!21 = !DILocalVariable(name: "inputBuffer", scope: !22, file: !13, line: 32, type: !24)
!22 = distinct !DILexicalBlock(scope: !23, file: !13, line: 31, column: 9)
!23 = distinct !DILexicalBlock(scope: !12, file: !13, line: 30, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 112, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 14)
!28 = !DILocation(line: 32, column: 18, scope: !22)
!29 = !DILocation(line: 34, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !13, line: 34, column: 17)
!31 = !DILocation(line: 34, column: 53, scope: !30)
!32 = !DILocation(line: 34, column: 17, scope: !30)
!33 = !DILocation(line: 34, column: 60, scope: !30)
!34 = !DILocation(line: 34, column: 17, scope: !22)
!35 = !DILocation(line: 37, column: 29, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !13, line: 35, column: 13)
!37 = !DILocation(line: 37, column: 24, scope: !36)
!38 = !DILocation(line: 37, column: 22, scope: !36)
!39 = !DILocation(line: 38, column: 13, scope: !36)
!40 = !DILocation(line: 41, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 13)
!42 = !DILocation(line: 44, column: 9, scope: !23)
!43 = !DILocation(line: 46, column: 5, scope: !12)
!44 = !DILocalVariable(name: "buffer", scope: !45, file: !13, line: 49, type: !47)
!45 = distinct !DILexicalBlock(scope: !46, file: !13, line: 48, column: 9)
!46 = distinct !DILexicalBlock(scope: !12, file: !13, line: 47, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 49, column: 17, scope: !45)
!51 = !DILocation(line: 52, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !45, file: !13, line: 52, column: 17)
!53 = !DILocation(line: 52, column: 22, scope: !52)
!54 = !DILocation(line: 52, column: 17, scope: !45)
!55 = !DILocation(line: 54, column: 37, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 53, column: 13)
!57 = !DILocation(line: 54, column: 30, scope: !56)
!58 = !DILocation(line: 54, column: 17, scope: !56)
!59 = !DILocation(line: 55, column: 13, scope: !56)
!60 = !DILocation(line: 58, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !52, file: !13, line: 57, column: 13)
!62 = !DILocation(line: 61, column: 9, scope: !46)
!63 = !DILocation(line: 63, column: 1, scope: !12)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fgets_16_good", scope: !13, file: !13, line: 142, type: !14, scopeLine: 143, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 144, column: 5, scope: !64)
!66 = !DILocation(line: 145, column: 5, scope: !64)
!67 = !DILocation(line: 146, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 157, type: !69, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!17, !17, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 157, type: !17)
!74 = !DILocation(line: 157, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 157, type: !71)
!76 = !DILocation(line: 157, column: 27, scope: !68)
!77 = !DILocation(line: 160, column: 22, scope: !68)
!78 = !DILocation(line: 160, column: 12, scope: !68)
!79 = !DILocation(line: 160, column: 5, scope: !68)
!80 = !DILocation(line: 162, column: 5, scope: !68)
!81 = !DILocation(line: 163, column: 5, scope: !68)
!82 = !DILocation(line: 164, column: 5, scope: !68)
!83 = !DILocation(line: 167, column: 5, scope: !68)
!84 = !DILocation(line: 168, column: 5, scope: !68)
!85 = !DILocation(line: 169, column: 5, scope: !68)
!86 = !DILocation(line: 171, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 70, type: !14, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !13, line: 72, type: !17)
!89 = !DILocation(line: 72, column: 9, scope: !87)
!90 = !DILocation(line: 74, column: 10, scope: !87)
!91 = !DILocation(line: 75, column: 5, scope: !87)
!92 = !DILocalVariable(name: "inputBuffer", scope: !93, file: !13, line: 78, type: !24)
!93 = distinct !DILexicalBlock(scope: !94, file: !13, line: 77, column: 9)
!94 = distinct !DILexicalBlock(scope: !87, file: !13, line: 76, column: 5)
!95 = !DILocation(line: 78, column: 18, scope: !93)
!96 = !DILocation(line: 80, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 80, column: 17)
!98 = !DILocation(line: 80, column: 53, scope: !97)
!99 = !DILocation(line: 80, column: 17, scope: !97)
!100 = !DILocation(line: 80, column: 60, scope: !97)
!101 = !DILocation(line: 80, column: 17, scope: !93)
!102 = !DILocation(line: 83, column: 29, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !13, line: 81, column: 13)
!104 = !DILocation(line: 83, column: 24, scope: !103)
!105 = !DILocation(line: 83, column: 22, scope: !103)
!106 = !DILocation(line: 84, column: 13, scope: !103)
!107 = !DILocation(line: 87, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !97, file: !13, line: 86, column: 13)
!109 = !DILocation(line: 90, column: 9, scope: !94)
!110 = !DILocation(line: 92, column: 5, scope: !87)
!111 = !DILocalVariable(name: "buffer", scope: !112, file: !13, line: 95, type: !47)
!112 = distinct !DILexicalBlock(scope: !113, file: !13, line: 94, column: 9)
!113 = distinct !DILexicalBlock(scope: !87, file: !13, line: 93, column: 5)
!114 = !DILocation(line: 95, column: 17, scope: !112)
!115 = !DILocation(line: 97, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 97, column: 17)
!117 = !DILocation(line: 97, column: 22, scope: !116)
!118 = !DILocation(line: 97, column: 27, scope: !116)
!119 = !DILocation(line: 97, column: 30, scope: !116)
!120 = !DILocation(line: 97, column: 35, scope: !116)
!121 = !DILocation(line: 97, column: 17, scope: !112)
!122 = !DILocation(line: 99, column: 37, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !13, line: 98, column: 13)
!124 = !DILocation(line: 99, column: 30, scope: !123)
!125 = !DILocation(line: 99, column: 17, scope: !123)
!126 = !DILocation(line: 100, column: 13, scope: !123)
!127 = !DILocation(line: 103, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !13, line: 102, column: 13)
!129 = !DILocation(line: 106, column: 9, scope: !113)
!130 = !DILocation(line: 108, column: 1, scope: !87)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 111, type: !14, scopeLine: 112, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocalVariable(name: "data", scope: !131, file: !13, line: 113, type: !17)
!133 = !DILocation(line: 113, column: 9, scope: !131)
!134 = !DILocation(line: 115, column: 10, scope: !131)
!135 = !DILocation(line: 116, column: 5, scope: !131)
!136 = !DILocation(line: 120, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !13, line: 117, column: 5)
!138 = !DILocation(line: 121, column: 9, scope: !137)
!139 = !DILocation(line: 123, column: 5, scope: !131)
!140 = !DILocalVariable(name: "buffer", scope: !141, file: !13, line: 126, type: !47)
!141 = distinct !DILexicalBlock(scope: !142, file: !13, line: 125, column: 9)
!142 = distinct !DILexicalBlock(scope: !131, file: !13, line: 124, column: 5)
!143 = !DILocation(line: 126, column: 17, scope: !141)
!144 = !DILocation(line: 129, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !13, line: 129, column: 17)
!146 = !DILocation(line: 129, column: 22, scope: !145)
!147 = !DILocation(line: 129, column: 17, scope: !141)
!148 = !DILocation(line: 131, column: 37, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !13, line: 130, column: 13)
!150 = !DILocation(line: 131, column: 30, scope: !149)
!151 = !DILocation(line: 131, column: 17, scope: !149)
!152 = !DILocation(line: 132, column: 13, scope: !149)
!153 = !DILocation(line: 135, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !145, file: !13, line: 134, column: 13)
!155 = !DILocation(line: 138, column: 9, scope: !142)
!156 = !DILocation(line: 140, column: 1, scope: !131)
