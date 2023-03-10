; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_badSink(i32* %dataArray) #0 !dbg !13 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %data, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !21
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !21
  %1 = load i32, i32* %arrayidx, align 4, !dbg !21
  store i32 %1, i32* %data, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !27
  %2 = bitcast i8* %call to i32*, !dbg !28
  store i32* %2, i32** %buffer, align 8, !dbg !26
  %3 = load i32*, i32** %buffer, align 8, !dbg !29
  %cmp = icmp eq i32* %3, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !38
  %cmp1 = icmp slt i32 %4, 10, !dbg !40
  br i1 %cmp1, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !42
  %6 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %6 to i64, !dbg !42
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %7, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !52
  %cmp3 = icmp sge i32 %8, 0, !dbg !54
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !55

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !56
  %10 = load i32, i32* %data, align 4, !dbg !58
  %idxprom5 = sext i32 %10 to i64, !dbg !56
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !56
  store i32 1, i32* %arrayidx6, align 4, !dbg !59
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond7, !dbg !62

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !63
  %cmp8 = icmp slt i32 %11, 10, !dbg !65
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !66

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !67
  %13 = load i32, i32* %i, align 4, !dbg !69
  %idxprom10 = sext i32 %13 to i64, !dbg !67
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !67
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !67
  call void @printIntLine(i32 %14), !dbg !70
  br label %for.inc12, !dbg !71

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !72
  %inc13 = add nsw i32 %15, 1, !dbg !72
  store i32 %inc13, i32* %i, align 4, !dbg !72
  br label %for.cond7, !dbg !73, !llvm.loop !74

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !76

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !79
  %17 = bitcast i32* %16 to i8*, !dbg !79
  call void @free(i8* %17) #5, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_goodG2BSink(i32* %dataArray) #0 !dbg !82 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !87
  %1 = load i32, i32* %arrayidx, align 4, !dbg !87
  store i32 %1, i32* %data, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !93
  %2 = bitcast i8* %call to i32*, !dbg !94
  store i32* %2, i32** %buffer, align 8, !dbg !92
  %3 = load i32*, i32** %buffer, align 8, !dbg !95
  %cmp = icmp eq i32* %3, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !104
  %cmp1 = icmp slt i32 %4, 10, !dbg !106
  br i1 %cmp1, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !108
  %6 = load i32, i32* %i, align 4, !dbg !110
  %idxprom = sext i32 %6 to i64, !dbg !108
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !113
  %inc = add nsw i32 %7, 1, !dbg !113
  store i32 %inc, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !117
  %cmp3 = icmp sge i32 %8, 0, !dbg !119
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !120

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !121
  %10 = load i32, i32* %data, align 4, !dbg !123
  %idxprom5 = sext i32 %10 to i64, !dbg !121
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !121
  store i32 1, i32* %arrayidx6, align 4, !dbg !124
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond7, !dbg !127

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !128
  %cmp8 = icmp slt i32 %11, 10, !dbg !130
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !131

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !132
  %13 = load i32, i32* %i, align 4, !dbg !134
  %idxprom10 = sext i32 %13 to i64, !dbg !132
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !132
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !132
  call void @printIntLine(i32 %14), !dbg !135
  br label %for.inc12, !dbg !136

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !137
  %inc13 = add nsw i32 %15, 1, !dbg !137
  store i32 %inc13, i32* %i, align 4, !dbg !137
  br label %for.cond7, !dbg !138, !llvm.loop !139

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !141

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !142
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !144
  %17 = bitcast i32* %16 to i8*, !dbg !144
  call void @free(i8* %17) #5, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_goodB2GSink(i32* %dataArray) #0 !dbg !147 {
entry:
  %dataArray.addr = alloca i32*, align 8
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32* %dataArray, i32** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dataArray.addr, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32* %data, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = load i32*, i32** %dataArray.addr, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 2, !dbg !152
  %1 = load i32, i32* %arrayidx, align 4, !dbg !152
  store i32 %1, i32* %data, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata i32* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call noalias align 16 i8* @malloc(i64 40) #5, !dbg !158
  %2 = bitcast i8* %call to i32*, !dbg !159
  store i32* %2, i32** %buffer, align 8, !dbg !157
  %3 = load i32*, i32** %buffer, align 8, !dbg !160
  %cmp = icmp eq i32* %3, null, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !169
  %cmp1 = icmp slt i32 %4, 10, !dbg !171
  br i1 %cmp1, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !173
  %6 = load i32, i32* %i, align 4, !dbg !175
  %idxprom = sext i32 %6 to i64, !dbg !173
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !173
  store i32 0, i32* %arrayidx2, align 4, !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !178
  %inc = add nsw i32 %7, 1, !dbg !178
  store i32 %inc, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !182
  %cmp3 = icmp sge i32 %8, 0, !dbg !184
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !185

land.lhs.true:                                    ; preds = %for.end
  %9 = load i32, i32* %data, align 4, !dbg !186
  %cmp4 = icmp slt i32 %9, 10, !dbg !187
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !188

if.then5:                                         ; preds = %land.lhs.true
  %10 = load i32*, i32** %buffer, align 8, !dbg !189
  %11 = load i32, i32* %data, align 4, !dbg !191
  %idxprom6 = sext i32 %11 to i64, !dbg !189
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6, !dbg !189
  store i32 1, i32* %arrayidx7, align 4, !dbg !192
  store i32 0, i32* %i, align 4, !dbg !193
  br label %for.cond8, !dbg !195

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %12 = load i32, i32* %i, align 4, !dbg !196
  %cmp9 = icmp slt i32 %12, 10, !dbg !198
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !199

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %buffer, align 8, !dbg !200
  %14 = load i32, i32* %i, align 4, !dbg !202
  %idxprom11 = sext i32 %14 to i64, !dbg !200
  %arrayidx12 = getelementptr inbounds i32, i32* %13, i64 %idxprom11, !dbg !200
  %15 = load i32, i32* %arrayidx12, align 4, !dbg !200
  call void @printIntLine(i32 %15), !dbg !203
  br label %for.inc13, !dbg !204

for.inc13:                                        ; preds = %for.body10
  %16 = load i32, i32* %i, align 4, !dbg !205
  %inc14 = add nsw i32 %16, 1, !dbg !205
  store i32 %inc14, i32* %i, align 4, !dbg !205
  br label %for.cond8, !dbg !206, !llvm.loop !207

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !209

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !210
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %17 = load i32*, i32** %buffer, align 8, !dbg !212
  %18 = bitcast i32* %17 to i8*, !dbg !212
  call void @free(i8* %18) #5, !dbg !213
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_badSink", scope: !14, file: !14, line: 22, type: !15, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "dataArray", arg: 1, scope: !13, file: !14, line: 22, type: !4)
!18 = !DILocation(line: 22, column: 73, scope: !13)
!19 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !5)
!20 = !DILocation(line: 25, column: 9, scope: !13)
!21 = !DILocation(line: 25, column: 16, scope: !13)
!22 = !DILocalVariable(name: "i", scope: !23, file: !14, line: 27, type: !5)
!23 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 5)
!24 = !DILocation(line: 27, column: 13, scope: !23)
!25 = !DILocalVariable(name: "buffer", scope: !23, file: !14, line: 28, type: !4)
!26 = !DILocation(line: 28, column: 15, scope: !23)
!27 = !DILocation(line: 28, column: 31, scope: !23)
!28 = !DILocation(line: 28, column: 24, scope: !23)
!29 = !DILocation(line: 29, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !14, line: 29, column: 13)
!31 = !DILocation(line: 29, column: 20, scope: !30)
!32 = !DILocation(line: 29, column: 13, scope: !23)
!33 = !DILocation(line: 29, column: 30, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !14, line: 29, column: 29)
!35 = !DILocation(line: 31, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !23, file: !14, line: 31, column: 9)
!37 = !DILocation(line: 31, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !14, line: 31, column: 9)
!40 = !DILocation(line: 31, column: 23, scope: !39)
!41 = !DILocation(line: 31, column: 9, scope: !36)
!42 = !DILocation(line: 33, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 32, column: 9)
!44 = !DILocation(line: 33, column: 20, scope: !43)
!45 = !DILocation(line: 33, column: 23, scope: !43)
!46 = !DILocation(line: 34, column: 9, scope: !43)
!47 = !DILocation(line: 31, column: 30, scope: !39)
!48 = !DILocation(line: 31, column: 9, scope: !39)
!49 = distinct !{!49, !41, !50, !51}
!50 = !DILocation(line: 34, column: 9, scope: !36)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 37, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !23, file: !14, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !23)
!56 = !DILocation(line: 39, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !14, line: 38, column: 9)
!58 = !DILocation(line: 39, column: 20, scope: !57)
!59 = !DILocation(line: 39, column: 26, scope: !57)
!60 = !DILocation(line: 41, column: 19, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !14, line: 41, column: 13)
!62 = !DILocation(line: 41, column: 17, scope: !61)
!63 = !DILocation(line: 41, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 41, column: 13)
!65 = !DILocation(line: 41, column: 26, scope: !64)
!66 = !DILocation(line: 41, column: 13, scope: !61)
!67 = !DILocation(line: 43, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 42, column: 13)
!69 = !DILocation(line: 43, column: 37, scope: !68)
!70 = !DILocation(line: 43, column: 17, scope: !68)
!71 = !DILocation(line: 44, column: 13, scope: !68)
!72 = !DILocation(line: 41, column: 33, scope: !64)
!73 = !DILocation(line: 41, column: 13, scope: !64)
!74 = distinct !{!74, !66, !75, !51}
!75 = !DILocation(line: 44, column: 13, scope: !61)
!76 = !DILocation(line: 45, column: 9, scope: !57)
!77 = !DILocation(line: 48, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !53, file: !14, line: 47, column: 9)
!79 = !DILocation(line: 50, column: 14, scope: !23)
!80 = !DILocation(line: 50, column: 9, scope: !23)
!81 = !DILocation(line: 52, column: 1, scope: !13)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_goodG2BSink", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "dataArray", arg: 1, scope: !82, file: !14, line: 59, type: !4)
!84 = !DILocation(line: 59, column: 77, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 61, type: !5)
!86 = !DILocation(line: 61, column: 9, scope: !82)
!87 = !DILocation(line: 61, column: 16, scope: !82)
!88 = !DILocalVariable(name: "i", scope: !89, file: !14, line: 63, type: !5)
!89 = distinct !DILexicalBlock(scope: !82, file: !14, line: 62, column: 5)
!90 = !DILocation(line: 63, column: 13, scope: !89)
!91 = !DILocalVariable(name: "buffer", scope: !89, file: !14, line: 64, type: !4)
!92 = !DILocation(line: 64, column: 15, scope: !89)
!93 = !DILocation(line: 64, column: 31, scope: !89)
!94 = !DILocation(line: 64, column: 24, scope: !89)
!95 = !DILocation(line: 65, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !14, line: 65, column: 13)
!97 = !DILocation(line: 65, column: 20, scope: !96)
!98 = !DILocation(line: 65, column: 13, scope: !89)
!99 = !DILocation(line: 65, column: 30, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 65, column: 29)
!101 = !DILocation(line: 67, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !89, file: !14, line: 67, column: 9)
!103 = !DILocation(line: 67, column: 14, scope: !102)
!104 = !DILocation(line: 67, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !14, line: 67, column: 9)
!106 = !DILocation(line: 67, column: 23, scope: !105)
!107 = !DILocation(line: 67, column: 9, scope: !102)
!108 = !DILocation(line: 69, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !14, line: 68, column: 9)
!110 = !DILocation(line: 69, column: 20, scope: !109)
!111 = !DILocation(line: 69, column: 23, scope: !109)
!112 = !DILocation(line: 70, column: 9, scope: !109)
!113 = !DILocation(line: 67, column: 30, scope: !105)
!114 = !DILocation(line: 67, column: 9, scope: !105)
!115 = distinct !{!115, !107, !116, !51}
!116 = !DILocation(line: 70, column: 9, scope: !102)
!117 = !DILocation(line: 73, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !89, file: !14, line: 73, column: 13)
!119 = !DILocation(line: 73, column: 18, scope: !118)
!120 = !DILocation(line: 73, column: 13, scope: !89)
!121 = !DILocation(line: 75, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !14, line: 74, column: 9)
!123 = !DILocation(line: 75, column: 20, scope: !122)
!124 = !DILocation(line: 75, column: 26, scope: !122)
!125 = !DILocation(line: 77, column: 19, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !14, line: 77, column: 13)
!127 = !DILocation(line: 77, column: 17, scope: !126)
!128 = !DILocation(line: 77, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !14, line: 77, column: 13)
!130 = !DILocation(line: 77, column: 26, scope: !129)
!131 = !DILocation(line: 77, column: 13, scope: !126)
!132 = !DILocation(line: 79, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !14, line: 78, column: 13)
!134 = !DILocation(line: 79, column: 37, scope: !133)
!135 = !DILocation(line: 79, column: 17, scope: !133)
!136 = !DILocation(line: 80, column: 13, scope: !133)
!137 = !DILocation(line: 77, column: 33, scope: !129)
!138 = !DILocation(line: 77, column: 13, scope: !129)
!139 = distinct !{!139, !131, !140, !51}
!140 = !DILocation(line: 80, column: 13, scope: !126)
!141 = !DILocation(line: 81, column: 9, scope: !122)
!142 = !DILocation(line: 84, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !118, file: !14, line: 83, column: 9)
!144 = !DILocation(line: 86, column: 14, scope: !89)
!145 = !DILocation(line: 86, column: 9, scope: !89)
!146 = !DILocation(line: 88, column: 1, scope: !82)
!147 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_fscanf_66b_goodB2GSink", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "dataArray", arg: 1, scope: !147, file: !14, line: 91, type: !4)
!149 = !DILocation(line: 91, column: 77, scope: !147)
!150 = !DILocalVariable(name: "data", scope: !147, file: !14, line: 93, type: !5)
!151 = !DILocation(line: 93, column: 9, scope: !147)
!152 = !DILocation(line: 93, column: 16, scope: !147)
!153 = !DILocalVariable(name: "i", scope: !154, file: !14, line: 95, type: !5)
!154 = distinct !DILexicalBlock(scope: !147, file: !14, line: 94, column: 5)
!155 = !DILocation(line: 95, column: 13, scope: !154)
!156 = !DILocalVariable(name: "buffer", scope: !154, file: !14, line: 96, type: !4)
!157 = !DILocation(line: 96, column: 15, scope: !154)
!158 = !DILocation(line: 96, column: 31, scope: !154)
!159 = !DILocation(line: 96, column: 24, scope: !154)
!160 = !DILocation(line: 97, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !14, line: 97, column: 13)
!162 = !DILocation(line: 97, column: 20, scope: !161)
!163 = !DILocation(line: 97, column: 13, scope: !154)
!164 = !DILocation(line: 97, column: 30, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !14, line: 97, column: 29)
!166 = !DILocation(line: 99, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !154, file: !14, line: 99, column: 9)
!168 = !DILocation(line: 99, column: 14, scope: !167)
!169 = !DILocation(line: 99, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 99, column: 9)
!171 = !DILocation(line: 99, column: 23, scope: !170)
!172 = !DILocation(line: 99, column: 9, scope: !167)
!173 = !DILocation(line: 101, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !14, line: 100, column: 9)
!175 = !DILocation(line: 101, column: 20, scope: !174)
!176 = !DILocation(line: 101, column: 23, scope: !174)
!177 = !DILocation(line: 102, column: 9, scope: !174)
!178 = !DILocation(line: 99, column: 30, scope: !170)
!179 = !DILocation(line: 99, column: 9, scope: !170)
!180 = distinct !{!180, !172, !181, !51}
!181 = !DILocation(line: 102, column: 9, scope: !167)
!182 = !DILocation(line: 104, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !154, file: !14, line: 104, column: 13)
!184 = !DILocation(line: 104, column: 18, scope: !183)
!185 = !DILocation(line: 104, column: 23, scope: !183)
!186 = !DILocation(line: 104, column: 26, scope: !183)
!187 = !DILocation(line: 104, column: 31, scope: !183)
!188 = !DILocation(line: 104, column: 13, scope: !154)
!189 = !DILocation(line: 106, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !183, file: !14, line: 105, column: 9)
!191 = !DILocation(line: 106, column: 20, scope: !190)
!192 = !DILocation(line: 106, column: 26, scope: !190)
!193 = !DILocation(line: 108, column: 19, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !14, line: 108, column: 13)
!195 = !DILocation(line: 108, column: 17, scope: !194)
!196 = !DILocation(line: 108, column: 24, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !14, line: 108, column: 13)
!198 = !DILocation(line: 108, column: 26, scope: !197)
!199 = !DILocation(line: 108, column: 13, scope: !194)
!200 = !DILocation(line: 110, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !14, line: 109, column: 13)
!202 = !DILocation(line: 110, column: 37, scope: !201)
!203 = !DILocation(line: 110, column: 17, scope: !201)
!204 = !DILocation(line: 111, column: 13, scope: !201)
!205 = !DILocation(line: 108, column: 33, scope: !197)
!206 = !DILocation(line: 108, column: 13, scope: !197)
!207 = distinct !{!207, !199, !208, !51}
!208 = !DILocation(line: 111, column: 13, scope: !194)
!209 = !DILocation(line: 112, column: 9, scope: !190)
!210 = !DILocation(line: 115, column: 13, scope: !211)
!211 = distinct !DILexicalBlock(scope: !183, file: !14, line: 114, column: 9)
!212 = !DILocation(line: 117, column: 14, scope: !154)
!213 = !DILocation(line: 117, column: 9, scope: !154)
!214 = !DILocation(line: 119, column: 1, scope: !147)
