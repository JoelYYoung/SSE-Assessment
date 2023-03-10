; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  br label %source, !dbg !19

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !20), !dbg !21
  store i32 -5, i32* %data, align 4, !dbg !22
  br label %sink, !dbg !23

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !24), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !33
  %1 = load i32, i32* %data, align 4, !dbg !34
  %cmp = icmp slt i32 %1, 10, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !45
  %cmp1 = icmp slt i32 %3, 10, !dbg !47
  br i1 %cmp1, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !49
  %idxprom2 = sext i32 %4 to i64, !dbg !51
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !51
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !51
  call void @printIntLine(i32 %5), !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !54
  %inc = add nsw i32 %6, 1, !dbg !54
  store i32 %inc, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !59

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_18_good() #0 !dbg !63 {
entry:
  call void @goodB2G(), !dbg !64
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__CWE839_negative_18_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__CWE839_negative_18_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !87 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %data, align 4, !dbg !90
  br label %source, !dbg !91

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !92), !dbg !93
  store i32 -5, i32* %data, align 4, !dbg !94
  br label %sink, !dbg !95

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !96), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !102
  %1 = load i32, i32* %data, align 4, !dbg !103
  %cmp = icmp sge i32 %1, 0, !dbg !105
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !106

land.lhs.true:                                    ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !107
  %cmp1 = icmp slt i32 %2, 10, !dbg !108
  br i1 %cmp1, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data, align 4, !dbg !110
  %idxprom = sext i32 %3 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !112
  store i32 1, i32* %arrayidx, align 4, !dbg !113
  store i32 0, i32* %i, align 4, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !117
  %cmp2 = icmp slt i32 %4, 10, !dbg !119
  br i1 %cmp2, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !121
  %idxprom3 = sext i32 %5 to i64, !dbg !123
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !123
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !123
  call void @printIntLine(i32 %6), !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !126
  %inc = add nsw i32 %7, 1, !dbg !126
  store i32 %inc, i32* %i, align 4, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !130

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !134 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 -1, i32* %data, align 4, !dbg !137
  br label %source, !dbg !138

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !139), !dbg !140
  store i32 7, i32* %data, align 4, !dbg !141
  br label %sink, !dbg !142

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !143), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !149
  %1 = load i32, i32* %data, align 4, !dbg !150
  %cmp = icmp slt i32 %1, 10, !dbg !152
  br i1 %cmp, label %if.then, label %if.else, !dbg !153

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !154
  %idxprom = sext i32 %2 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !156
  store i32 1, i32* %arrayidx, align 4, !dbg !157
  store i32 0, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !161
  %cmp1 = icmp slt i32 %3, 10, !dbg !163
  br i1 %cmp1, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !165
  %idxprom2 = sext i32 %4 to i64, !dbg !167
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !167
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !167
  call void @printIntLine(i32 %5), !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !170
  %inc = add nsw i32 %6, 1, !dbg !170
  store i32 %inc, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !174

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !175
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 26, column: 10, scope: !11)
!19 = !DILocation(line: 27, column: 5, scope: !11)
!20 = !DILabel(scope: !11, name: "source", file: !12, line: 28)
!21 = !DILocation(line: 28, column: 1, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocation(line: 31, column: 5, scope: !11)
!24 = !DILabel(scope: !11, name: "sink", file: !12, line: 32)
!25 = !DILocation(line: 32, column: 1, scope: !11)
!26 = !DILocalVariable(name: "i", scope: !27, file: !12, line: 34, type: !16)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!28 = !DILocation(line: 34, column: 13, scope: !27)
!29 = !DILocalVariable(name: "buffer", scope: !27, file: !12, line: 35, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 35, column: 13, scope: !27)
!34 = !DILocation(line: 38, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !12, line: 38, column: 13)
!36 = !DILocation(line: 38, column: 18, scope: !35)
!37 = !DILocation(line: 38, column: 13, scope: !27)
!38 = !DILocation(line: 40, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 39, column: 9)
!40 = !DILocation(line: 40, column: 13, scope: !39)
!41 = !DILocation(line: 40, column: 26, scope: !39)
!42 = !DILocation(line: 42, column: 19, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 42, column: 13)
!44 = !DILocation(line: 42, column: 17, scope: !43)
!45 = !DILocation(line: 42, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 42, column: 13)
!47 = !DILocation(line: 42, column: 26, scope: !46)
!48 = !DILocation(line: 42, column: 13, scope: !43)
!49 = !DILocation(line: 44, column: 37, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 43, column: 13)
!51 = !DILocation(line: 44, column: 30, scope: !50)
!52 = !DILocation(line: 44, column: 17, scope: !50)
!53 = !DILocation(line: 45, column: 13, scope: !50)
!54 = !DILocation(line: 42, column: 33, scope: !46)
!55 = !DILocation(line: 42, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 45, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 46, column: 9, scope: !39)
!60 = !DILocation(line: 49, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !35, file: !12, line: 48, column: 9)
!62 = !DILocation(line: 52, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_18_good", scope: !12, file: !12, line: 124, type: !13, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 126, column: 5, scope: !63)
!65 = !DILocation(line: 127, column: 5, scope: !63)
!66 = !DILocation(line: 128, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 139, type: !68, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!16, !16, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 139, type: !16)
!74 = !DILocation(line: 139, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 139, type: !70)
!76 = !DILocation(line: 139, column: 27, scope: !67)
!77 = !DILocation(line: 142, column: 22, scope: !67)
!78 = !DILocation(line: 142, column: 12, scope: !67)
!79 = !DILocation(line: 142, column: 5, scope: !67)
!80 = !DILocation(line: 144, column: 5, scope: !67)
!81 = !DILocation(line: 145, column: 5, scope: !67)
!82 = !DILocation(line: 146, column: 5, scope: !67)
!83 = !DILocation(line: 149, column: 5, scope: !67)
!84 = !DILocation(line: 150, column: 5, scope: !67)
!85 = !DILocation(line: 151, column: 5, scope: !67)
!86 = !DILocation(line: 153, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 61, type: !16)
!89 = !DILocation(line: 61, column: 9, scope: !87)
!90 = !DILocation(line: 63, column: 10, scope: !87)
!91 = !DILocation(line: 64, column: 5, scope: !87)
!92 = !DILabel(scope: !87, name: "source", file: !12, line: 65)
!93 = !DILocation(line: 65, column: 1, scope: !87)
!94 = !DILocation(line: 67, column: 10, scope: !87)
!95 = !DILocation(line: 68, column: 5, scope: !87)
!96 = !DILabel(scope: !87, name: "sink", file: !12, line: 69)
!97 = !DILocation(line: 69, column: 1, scope: !87)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 71, type: !16)
!99 = distinct !DILexicalBlock(scope: !87, file: !12, line: 70, column: 5)
!100 = !DILocation(line: 71, column: 13, scope: !99)
!101 = !DILocalVariable(name: "buffer", scope: !99, file: !12, line: 72, type: !30)
!102 = !DILocation(line: 72, column: 13, scope: !99)
!103 = !DILocation(line: 74, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !12, line: 74, column: 13)
!105 = !DILocation(line: 74, column: 18, scope: !104)
!106 = !DILocation(line: 74, column: 23, scope: !104)
!107 = !DILocation(line: 74, column: 26, scope: !104)
!108 = !DILocation(line: 74, column: 31, scope: !104)
!109 = !DILocation(line: 74, column: 13, scope: !99)
!110 = !DILocation(line: 76, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 75, column: 9)
!112 = !DILocation(line: 76, column: 13, scope: !111)
!113 = !DILocation(line: 76, column: 26, scope: !111)
!114 = !DILocation(line: 78, column: 19, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 78, column: 13)
!116 = !DILocation(line: 78, column: 17, scope: !115)
!117 = !DILocation(line: 78, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 78, column: 13)
!119 = !DILocation(line: 78, column: 26, scope: !118)
!120 = !DILocation(line: 78, column: 13, scope: !115)
!121 = !DILocation(line: 80, column: 37, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 79, column: 13)
!123 = !DILocation(line: 80, column: 30, scope: !122)
!124 = !DILocation(line: 80, column: 17, scope: !122)
!125 = !DILocation(line: 81, column: 13, scope: !122)
!126 = !DILocation(line: 78, column: 33, scope: !118)
!127 = !DILocation(line: 78, column: 13, scope: !118)
!128 = distinct !{!128, !120, !129, !58}
!129 = !DILocation(line: 81, column: 13, scope: !115)
!130 = !DILocation(line: 82, column: 9, scope: !111)
!131 = !DILocation(line: 85, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !104, file: !12, line: 84, column: 9)
!133 = !DILocation(line: 88, column: 1, scope: !87)
!134 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 93, type: !16)
!136 = !DILocation(line: 93, column: 9, scope: !134)
!137 = !DILocation(line: 95, column: 10, scope: !134)
!138 = !DILocation(line: 96, column: 5, scope: !134)
!139 = !DILabel(scope: !134, name: "source", file: !12, line: 97)
!140 = !DILocation(line: 97, column: 1, scope: !134)
!141 = !DILocation(line: 100, column: 10, scope: !134)
!142 = !DILocation(line: 101, column: 5, scope: !134)
!143 = !DILabel(scope: !134, name: "sink", file: !12, line: 102)
!144 = !DILocation(line: 102, column: 1, scope: !134)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 104, type: !16)
!146 = distinct !DILexicalBlock(scope: !134, file: !12, line: 103, column: 5)
!147 = !DILocation(line: 104, column: 13, scope: !146)
!148 = !DILocalVariable(name: "buffer", scope: !146, file: !12, line: 105, type: !30)
!149 = !DILocation(line: 105, column: 13, scope: !146)
!150 = !DILocation(line: 108, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !12, line: 108, column: 13)
!152 = !DILocation(line: 108, column: 18, scope: !151)
!153 = !DILocation(line: 108, column: 13, scope: !146)
!154 = !DILocation(line: 110, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !12, line: 109, column: 9)
!156 = !DILocation(line: 110, column: 13, scope: !155)
!157 = !DILocation(line: 110, column: 26, scope: !155)
!158 = !DILocation(line: 112, column: 19, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 112, column: 13)
!160 = !DILocation(line: 112, column: 17, scope: !159)
!161 = !DILocation(line: 112, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 112, column: 13)
!163 = !DILocation(line: 112, column: 26, scope: !162)
!164 = !DILocation(line: 112, column: 13, scope: !159)
!165 = !DILocation(line: 114, column: 37, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 113, column: 13)
!167 = !DILocation(line: 114, column: 30, scope: !166)
!168 = !DILocation(line: 114, column: 17, scope: !166)
!169 = !DILocation(line: 115, column: 13, scope: !166)
!170 = !DILocation(line: 112, column: 33, scope: !162)
!171 = !DILocation(line: 112, column: 13, scope: !162)
!172 = distinct !{!172, !164, !173, !58}
!173 = !DILocation(line: 115, column: 13, scope: !159)
!174 = !DILocation(line: 116, column: 9, scope: !155)
!175 = !DILocation(line: 119, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !151, file: !12, line: 118, column: 9)
!177 = !DILocation(line: 122, column: 1, scope: !134)
