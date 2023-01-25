; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %1, 0, !dbg !28
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !30

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !51
  store i64 %call3, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !56
  %7 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp4 = icmp ult i64 %6, %7, !dbg !59
  br i1 %cmp4, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !61
  %9 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !61
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !65
  store i8 %10, i8* %arrayidx6, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %12, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !73
  store i8 0, i8* %arrayidx7, align 1, !dbg !74
  %13 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %13), !dbg !76
  %14 = load i8*, i8** %data, align 8, !dbg !77
  call void @free(i8* %14) #7, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !106
  store i8* %call, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !114
  %tobool = icmp ne i32 %1, 0, !dbg !114
  br i1 %tobool, label %if.then1, label %if.else, !dbg !116

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end2, !dbg !119

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !122
  %3 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !133
  store i64 %call3, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !138
  %7 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp4 = icmp ult i64 %6, %7, !dbg !141
  br i1 %cmp4, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !143
  %9 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !143
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !143
  %11 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !147
  store i8 %10, i8* %arrayidx6, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %12, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !154
  store i8 0, i8* %arrayidx7, align 1, !dbg !155
  %13 = load i8*, i8** %data, align 8, !dbg !156
  call void @printLine(i8* %13), !dbg !157
  %14 = load i8*, i8** %data, align 8, !dbg !158
  call void @free(i8* %14) #7, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !162, metadata !DIExpression()), !dbg !163
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !164
  store i8* %call, i8** %data, align 8, !dbg !165
  %0 = load i8*, i8** %data, align 8, !dbg !166
  %cmp = icmp eq i8* %0, null, !dbg !168
  br i1 %cmp, label %if.then, label %if.end, !dbg !169

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !170
  unreachable, !dbg !170

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !172
  %tobool = icmp ne i32 %1, 0, !dbg !172
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !174

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !177
  %3 = load i8*, i8** %data, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !178
  store i8 0, i8* %arrayidx, align 1, !dbg !179
  br label %if.end2, !dbg !180

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !181, metadata !DIExpression()), !dbg !183
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !186, metadata !DIExpression()), !dbg !187
  %5 = load i8*, i8** %data, align 8, !dbg !188
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !189
  store i64 %call3, i64* %dataLen, align 8, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !194
  %7 = load i64, i64* %dataLen, align 8, !dbg !196
  %cmp4 = icmp ult i64 %6, %7, !dbg !197
  br i1 %cmp4, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !199
  %9 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !199
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !199
  %11 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !203
  store i8 %10, i8* %arrayidx6, align 1, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !206
  %inc = add i64 %12, 1, !dbg !206
  store i64 %inc, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !210
  store i8 0, i8* %arrayidx7, align 1, !dbg !211
  %13 = load i8*, i8** %data, align 8, !dbg !212
  call void @printLine(i8* %13), !dbg !213
  %14 = load i8*, i8** %data, align 8, !dbg !214
  call void @free(i8* %14) #7, !dbg !215
  ret void, !dbg !216
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !14)
!31 = !DILocation(line: 31, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 36, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 16, scope: !38)
!48 = !DILocalVariable(name: "dataLen", scope: !38, file: !15, line: 36, type: !44)
!49 = !DILocation(line: 36, column: 19, scope: !38)
!50 = !DILocation(line: 37, column: 26, scope: !38)
!51 = !DILocation(line: 37, column: 19, scope: !38)
!52 = !DILocation(line: 37, column: 17, scope: !38)
!53 = !DILocation(line: 39, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !15, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 14, scope: !54)
!56 = !DILocation(line: 39, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !15, line: 39, column: 9)
!58 = !DILocation(line: 39, column: 25, scope: !57)
!59 = !DILocation(line: 39, column: 23, scope: !57)
!60 = !DILocation(line: 39, column: 9, scope: !54)
!61 = !DILocation(line: 41, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !15, line: 40, column: 9)
!63 = !DILocation(line: 41, column: 28, scope: !62)
!64 = !DILocation(line: 41, column: 18, scope: !62)
!65 = !DILocation(line: 41, column: 13, scope: !62)
!66 = !DILocation(line: 41, column: 21, scope: !62)
!67 = !DILocation(line: 42, column: 9, scope: !62)
!68 = !DILocation(line: 39, column: 35, scope: !57)
!69 = !DILocation(line: 39, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 42, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 43, column: 9, scope: !38)
!74 = !DILocation(line: 43, column: 20, scope: !38)
!75 = !DILocation(line: 44, column: 19, scope: !38)
!76 = !DILocation(line: 44, column: 9, scope: !38)
!77 = !DILocation(line: 45, column: 14, scope: !38)
!78 = !DILocation(line: 45, column: 9, scope: !38)
!79 = !DILocation(line: 47, column: 1, scope: !14)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_10_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 114, column: 5, scope: !80)
!82 = !DILocation(line: 115, column: 5, scope: !80)
!83 = !DILocation(line: 116, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 128, type: !85, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 128, type: !87)
!90 = !DILocation(line: 128, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 128, type: !88)
!92 = !DILocation(line: 128, column: 27, scope: !84)
!93 = !DILocation(line: 131, column: 22, scope: !84)
!94 = !DILocation(line: 131, column: 12, scope: !84)
!95 = !DILocation(line: 131, column: 5, scope: !84)
!96 = !DILocation(line: 133, column: 5, scope: !84)
!97 = !DILocation(line: 134, column: 5, scope: !84)
!98 = !DILocation(line: 135, column: 5, scope: !84)
!99 = !DILocation(line: 138, column: 5, scope: !84)
!100 = !DILocation(line: 139, column: 5, scope: !84)
!101 = !DILocation(line: 140, column: 5, scope: !84)
!102 = !DILocation(line: 142, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 56, type: !4)
!105 = !DILocation(line: 56, column: 12, scope: !103)
!106 = !DILocation(line: 57, column: 20, scope: !103)
!107 = !DILocation(line: 57, column: 10, scope: !103)
!108 = !DILocation(line: 58, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !15, line: 58, column: 9)
!110 = !DILocation(line: 58, column: 14, scope: !109)
!111 = !DILocation(line: 58, column: 9, scope: !103)
!112 = !DILocation(line: 58, column: 24, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 58, column: 23)
!114 = !DILocation(line: 59, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !15, line: 59, column: 8)
!116 = !DILocation(line: 59, column: 8, scope: !103)
!117 = !DILocation(line: 62, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 60, column: 5)
!119 = !DILocation(line: 63, column: 5, scope: !118)
!120 = !DILocation(line: 67, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !15, line: 65, column: 5)
!122 = !DILocation(line: 67, column: 9, scope: !121)
!123 = !DILocation(line: 68, column: 9, scope: !121)
!124 = !DILocation(line: 68, column: 20, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !15, line: 71, type: !39)
!126 = distinct !DILexicalBlock(scope: !103, file: !15, line: 70, column: 5)
!127 = !DILocation(line: 71, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !15, line: 72, type: !44)
!129 = !DILocation(line: 72, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !15, line: 72, type: !44)
!131 = !DILocation(line: 72, column: 19, scope: !126)
!132 = !DILocation(line: 73, column: 26, scope: !126)
!133 = !DILocation(line: 73, column: 19, scope: !126)
!134 = !DILocation(line: 73, column: 17, scope: !126)
!135 = !DILocation(line: 75, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !15, line: 75, column: 9)
!137 = !DILocation(line: 75, column: 14, scope: !136)
!138 = !DILocation(line: 75, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !15, line: 75, column: 9)
!140 = !DILocation(line: 75, column: 25, scope: !139)
!141 = !DILocation(line: 75, column: 23, scope: !139)
!142 = !DILocation(line: 75, column: 9, scope: !136)
!143 = !DILocation(line: 77, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !15, line: 76, column: 9)
!145 = !DILocation(line: 77, column: 28, scope: !144)
!146 = !DILocation(line: 77, column: 18, scope: !144)
!147 = !DILocation(line: 77, column: 13, scope: !144)
!148 = !DILocation(line: 77, column: 21, scope: !144)
!149 = !DILocation(line: 78, column: 9, scope: !144)
!150 = !DILocation(line: 75, column: 35, scope: !139)
!151 = !DILocation(line: 75, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !72}
!153 = !DILocation(line: 78, column: 9, scope: !136)
!154 = !DILocation(line: 79, column: 9, scope: !126)
!155 = !DILocation(line: 79, column: 20, scope: !126)
!156 = !DILocation(line: 80, column: 19, scope: !126)
!157 = !DILocation(line: 80, column: 9, scope: !126)
!158 = !DILocation(line: 81, column: 14, scope: !126)
!159 = !DILocation(line: 81, column: 9, scope: !126)
!160 = !DILocation(line: 83, column: 1, scope: !103)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !15, line: 88, type: !4)
!163 = !DILocation(line: 88, column: 12, scope: !161)
!164 = !DILocation(line: 89, column: 20, scope: !161)
!165 = !DILocation(line: 89, column: 10, scope: !161)
!166 = !DILocation(line: 90, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !15, line: 90, column: 9)
!168 = !DILocation(line: 90, column: 14, scope: !167)
!169 = !DILocation(line: 90, column: 9, scope: !161)
!170 = !DILocation(line: 90, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 90, column: 23)
!172 = !DILocation(line: 91, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !15, line: 91, column: 8)
!174 = !DILocation(line: 91, column: 8, scope: !161)
!175 = !DILocation(line: 94, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !15, line: 92, column: 5)
!177 = !DILocation(line: 94, column: 9, scope: !176)
!178 = !DILocation(line: 95, column: 9, scope: !176)
!179 = !DILocation(line: 95, column: 20, scope: !176)
!180 = !DILocation(line: 96, column: 5, scope: !176)
!181 = !DILocalVariable(name: "dest", scope: !182, file: !15, line: 98, type: !39)
!182 = distinct !DILexicalBlock(scope: !161, file: !15, line: 97, column: 5)
!183 = !DILocation(line: 98, column: 14, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !182, file: !15, line: 99, type: !44)
!185 = !DILocation(line: 99, column: 16, scope: !182)
!186 = !DILocalVariable(name: "dataLen", scope: !182, file: !15, line: 99, type: !44)
!187 = !DILocation(line: 99, column: 19, scope: !182)
!188 = !DILocation(line: 100, column: 26, scope: !182)
!189 = !DILocation(line: 100, column: 19, scope: !182)
!190 = !DILocation(line: 100, column: 17, scope: !182)
!191 = !DILocation(line: 102, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !182, file: !15, line: 102, column: 9)
!193 = !DILocation(line: 102, column: 14, scope: !192)
!194 = !DILocation(line: 102, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !15, line: 102, column: 9)
!196 = !DILocation(line: 102, column: 25, scope: !195)
!197 = !DILocation(line: 102, column: 23, scope: !195)
!198 = !DILocation(line: 102, column: 9, scope: !192)
!199 = !DILocation(line: 104, column: 23, scope: !200)
!200 = distinct !DILexicalBlock(scope: !195, file: !15, line: 103, column: 9)
!201 = !DILocation(line: 104, column: 28, scope: !200)
!202 = !DILocation(line: 104, column: 18, scope: !200)
!203 = !DILocation(line: 104, column: 13, scope: !200)
!204 = !DILocation(line: 104, column: 21, scope: !200)
!205 = !DILocation(line: 105, column: 9, scope: !200)
!206 = !DILocation(line: 102, column: 35, scope: !195)
!207 = !DILocation(line: 102, column: 9, scope: !195)
!208 = distinct !{!208, !198, !209, !72}
!209 = !DILocation(line: 105, column: 9, scope: !192)
!210 = !DILocation(line: 106, column: 9, scope: !182)
!211 = !DILocation(line: 106, column: 20, scope: !182)
!212 = !DILocation(line: 107, column: 19, scope: !182)
!213 = !DILocation(line: 107, column: 9, scope: !182)
!214 = !DILocation(line: 108, column: 14, scope: !182)
!215 = !DILocation(line: 108, column: 9, scope: !182)
!216 = !DILocation(line: 110, column: 1, scope: !161)
