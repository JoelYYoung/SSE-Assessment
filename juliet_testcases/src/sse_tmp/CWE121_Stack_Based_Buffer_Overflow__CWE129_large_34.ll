; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType = type { i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion, metadata !18, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* %data, align 4, !dbg !27
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !28
  store i32 %0, i32* %unionFirst, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !33
  %1 = load i32, i32* %unionSecond, align 4, !dbg !33
  store i32 %1, i32* %data1, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !37, metadata !DIExpression()), !dbg !41
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !41
  %3 = load i32, i32* %data1, align 4, !dbg !42
  %cmp = icmp sge i32 %3, 0, !dbg !44
  br i1 %cmp, label %if.then, label %if.else, !dbg !45

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !46
  %idxprom = sext i32 %4 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !48
  store i32 1, i32* %arrayidx, align 4, !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !53
  %cmp2 = icmp slt i32 %5, 10, !dbg !55
  br i1 %cmp2, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !57
  %idxprom3 = sext i32 %6 to i64, !dbg !59
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !59
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !59
  call void @printIntLine(i32 %7), !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc = add nsw i32 %8, 1, !dbg !62
  store i32 %inc, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !67

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !68
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  call void @goodB2G(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 -1, i32* %data, align 4, !dbg !100
  store i32 7, i32* %data, align 4, !dbg !101
  %0 = load i32, i32* %data, align 4, !dbg !102
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !103
  store i32 %0, i32* %unionFirst, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !108
  %1 = load i32, i32* %unionSecond, align 4, !dbg !108
  store i32 %1, i32* %data1, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !113
  %3 = load i32, i32* %data1, align 4, !dbg !114
  %cmp = icmp sge i32 %3, 0, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !118
  %idxprom = sext i32 %4 to i64, !dbg !120
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !120
  store i32 1, i32* %arrayidx, align 4, !dbg !121
  store i32 0, i32* %i, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !125
  %cmp2 = icmp slt i32 %5, 10, !dbg !127
  br i1 %cmp2, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !129
  %idxprom3 = sext i32 %6 to i64, !dbg !131
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !131
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !131
  call void @printIntLine(i32 %7), !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !134
  %inc = add nsw i32 %8, 1, !dbg !134
  store i32 %inc, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !142 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion, metadata !145, metadata !DIExpression()), !dbg !146
  store i32 -1, i32* %data, align 4, !dbg !147
  store i32 10, i32* %data, align 4, !dbg !148
  %0 = load i32, i32* %data, align 4, !dbg !149
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !150
  store i32 %0, i32* %unionFirst, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !152, metadata !DIExpression()), !dbg !154
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType* %myUnion to i32*, !dbg !155
  %1 = load i32, i32* %unionSecond, align 4, !dbg !155
  store i32 %1, i32* %data1, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata i32* %i, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !159, metadata !DIExpression()), !dbg !160
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !160
  %3 = load i32, i32* %data1, align 4, !dbg !161
  %cmp = icmp sge i32 %3, 0, !dbg !163
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !164

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !165
  %cmp2 = icmp slt i32 %4, 10, !dbg !166
  br i1 %cmp2, label %if.then, label %if.else, !dbg !167

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %data1, align 4, !dbg !168
  %idxprom = sext i32 %5 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !170
  store i32 1, i32* %arrayidx, align 4, !dbg !171
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !175
  %cmp3 = icmp slt i32 %6, 10, !dbg !177
  br i1 %cmp3, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %7 = load i32, i32* %i, align 4, !dbg !179
  %idxprom4 = sext i32 %7 to i64, !dbg !181
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !181
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !181
  call void @printIntLine(i32 %8), !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !184
  %inc = add nsw i32 %9, 1, !dbg !184
  store i32 %inc, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !188

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !189
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !191
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_unionType", file: !12, line: 24, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 20, size: 32, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !20, file: !12, line: 22, baseType: !16, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !20, file: !12, line: 23, baseType: !16, size: 32)
!24 = !DILocation(line: 31, column: 67, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 35, column: 10, scope: !11)
!27 = !DILocation(line: 36, column: 26, scope: !11)
!28 = !DILocation(line: 36, column: 13, scope: !11)
!29 = !DILocation(line: 36, column: 24, scope: !11)
!30 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 38, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!32 = !DILocation(line: 38, column: 13, scope: !31)
!33 = !DILocation(line: 38, column: 28, scope: !31)
!34 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 40, type: !16)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 39, column: 9)
!36 = !DILocation(line: 40, column: 17, scope: !35)
!37 = !DILocalVariable(name: "buffer", scope: !35, file: !12, line: 41, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 10)
!41 = !DILocation(line: 41, column: 17, scope: !35)
!42 = !DILocation(line: 44, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !35, file: !12, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 22, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !35)
!46 = !DILocation(line: 46, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 45, column: 13)
!48 = !DILocation(line: 46, column: 17, scope: !47)
!49 = !DILocation(line: 46, column: 30, scope: !47)
!50 = !DILocation(line: 48, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 48, column: 17)
!52 = !DILocation(line: 48, column: 21, scope: !51)
!53 = !DILocation(line: 48, column: 28, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 48, column: 17)
!55 = !DILocation(line: 48, column: 30, scope: !54)
!56 = !DILocation(line: 48, column: 17, scope: !51)
!57 = !DILocation(line: 50, column: 41, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 49, column: 17)
!59 = !DILocation(line: 50, column: 34, scope: !58)
!60 = !DILocation(line: 50, column: 21, scope: !58)
!61 = !DILocation(line: 51, column: 17, scope: !58)
!62 = !DILocation(line: 48, column: 37, scope: !54)
!63 = !DILocation(line: 48, column: 17, scope: !54)
!64 = distinct !{!64, !56, !65, !66}
!65 = !DILocation(line: 51, column: 17, scope: !51)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 52, column: 13, scope: !47)
!68 = !DILocation(line: 55, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !43, file: !12, line: 54, column: 13)
!70 = !DILocation(line: 59, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_34_good", scope: !12, file: !12, line: 133, type: !13, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 135, column: 5, scope: !71)
!73 = !DILocation(line: 136, column: 5, scope: !71)
!74 = !DILocation(line: 137, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 147, type: !76, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!16, !16, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 147, type: !16)
!82 = !DILocation(line: 147, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 147, type: !78)
!84 = !DILocation(line: 147, column: 27, scope: !75)
!85 = !DILocation(line: 150, column: 22, scope: !75)
!86 = !DILocation(line: 150, column: 12, scope: !75)
!87 = !DILocation(line: 150, column: 5, scope: !75)
!88 = !DILocation(line: 152, column: 5, scope: !75)
!89 = !DILocation(line: 153, column: 5, scope: !75)
!90 = !DILocation(line: 154, column: 5, scope: !75)
!91 = !DILocation(line: 157, column: 5, scope: !75)
!92 = !DILocation(line: 158, column: 5, scope: !75)
!93 = !DILocation(line: 159, column: 5, scope: !75)
!94 = !DILocation(line: 161, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 68, type: !16)
!97 = !DILocation(line: 68, column: 9, scope: !95)
!98 = !DILocalVariable(name: "myUnion", scope: !95, file: !12, line: 69, type: !19)
!99 = !DILocation(line: 69, column: 67, scope: !95)
!100 = !DILocation(line: 71, column: 10, scope: !95)
!101 = !DILocation(line: 74, column: 10, scope: !95)
!102 = !DILocation(line: 75, column: 26, scope: !95)
!103 = !DILocation(line: 75, column: 13, scope: !95)
!104 = !DILocation(line: 75, column: 24, scope: !95)
!105 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 77, type: !16)
!106 = distinct !DILexicalBlock(scope: !95, file: !12, line: 76, column: 5)
!107 = !DILocation(line: 77, column: 13, scope: !106)
!108 = !DILocation(line: 77, column: 28, scope: !106)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 79, type: !16)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 78, column: 9)
!111 = !DILocation(line: 79, column: 17, scope: !110)
!112 = !DILocalVariable(name: "buffer", scope: !110, file: !12, line: 80, type: !38)
!113 = !DILocation(line: 80, column: 17, scope: !110)
!114 = !DILocation(line: 83, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !12, line: 83, column: 17)
!116 = !DILocation(line: 83, column: 22, scope: !115)
!117 = !DILocation(line: 83, column: 17, scope: !110)
!118 = !DILocation(line: 85, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 84, column: 13)
!120 = !DILocation(line: 85, column: 17, scope: !119)
!121 = !DILocation(line: 85, column: 30, scope: !119)
!122 = !DILocation(line: 87, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !12, line: 87, column: 17)
!124 = !DILocation(line: 87, column: 21, scope: !123)
!125 = !DILocation(line: 87, column: 28, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 87, column: 17)
!127 = !DILocation(line: 87, column: 30, scope: !126)
!128 = !DILocation(line: 87, column: 17, scope: !123)
!129 = !DILocation(line: 89, column: 41, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 88, column: 17)
!131 = !DILocation(line: 89, column: 34, scope: !130)
!132 = !DILocation(line: 89, column: 21, scope: !130)
!133 = !DILocation(line: 90, column: 17, scope: !130)
!134 = !DILocation(line: 87, column: 37, scope: !126)
!135 = !DILocation(line: 87, column: 17, scope: !126)
!136 = distinct !{!136, !128, !137, !66}
!137 = !DILocation(line: 90, column: 17, scope: !123)
!138 = !DILocation(line: 91, column: 13, scope: !119)
!139 = !DILocation(line: 94, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !115, file: !12, line: 93, column: 13)
!141 = !DILocation(line: 98, column: 1, scope: !95)
!142 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 103, type: !16)
!144 = !DILocation(line: 103, column: 9, scope: !142)
!145 = !DILocalVariable(name: "myUnion", scope: !142, file: !12, line: 104, type: !19)
!146 = !DILocation(line: 104, column: 67, scope: !142)
!147 = !DILocation(line: 106, column: 10, scope: !142)
!148 = !DILocation(line: 108, column: 10, scope: !142)
!149 = !DILocation(line: 109, column: 26, scope: !142)
!150 = !DILocation(line: 109, column: 13, scope: !142)
!151 = !DILocation(line: 109, column: 24, scope: !142)
!152 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 111, type: !16)
!153 = distinct !DILexicalBlock(scope: !142, file: !12, line: 110, column: 5)
!154 = !DILocation(line: 111, column: 13, scope: !153)
!155 = !DILocation(line: 111, column: 28, scope: !153)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 113, type: !16)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 112, column: 9)
!158 = !DILocation(line: 113, column: 17, scope: !157)
!159 = !DILocalVariable(name: "buffer", scope: !157, file: !12, line: 114, type: !38)
!160 = !DILocation(line: 114, column: 17, scope: !157)
!161 = !DILocation(line: 116, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !12, line: 116, column: 17)
!163 = !DILocation(line: 116, column: 22, scope: !162)
!164 = !DILocation(line: 116, column: 27, scope: !162)
!165 = !DILocation(line: 116, column: 30, scope: !162)
!166 = !DILocation(line: 116, column: 35, scope: !162)
!167 = !DILocation(line: 116, column: 17, scope: !157)
!168 = !DILocation(line: 118, column: 24, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !12, line: 117, column: 13)
!170 = !DILocation(line: 118, column: 17, scope: !169)
!171 = !DILocation(line: 118, column: 30, scope: !169)
!172 = !DILocation(line: 120, column: 23, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !12, line: 120, column: 17)
!174 = !DILocation(line: 120, column: 21, scope: !173)
!175 = !DILocation(line: 120, column: 28, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !12, line: 120, column: 17)
!177 = !DILocation(line: 120, column: 30, scope: !176)
!178 = !DILocation(line: 120, column: 17, scope: !173)
!179 = !DILocation(line: 122, column: 41, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 121, column: 17)
!181 = !DILocation(line: 122, column: 34, scope: !180)
!182 = !DILocation(line: 122, column: 21, scope: !180)
!183 = !DILocation(line: 123, column: 17, scope: !180)
!184 = !DILocation(line: 120, column: 37, scope: !176)
!185 = !DILocation(line: 120, column: 17, scope: !176)
!186 = distinct !{!186, !178, !187, !66}
!187 = !DILocation(line: 123, column: 17, scope: !173)
!188 = !DILocation(line: 124, column: 13, scope: !169)
!189 = !DILocation(line: 127, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !162, file: !12, line: 126, column: 13)
!191 = !DILocation(line: 131, column: 1, scope: !142)
