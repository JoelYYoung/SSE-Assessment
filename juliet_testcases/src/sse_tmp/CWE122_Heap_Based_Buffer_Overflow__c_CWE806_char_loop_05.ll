; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %1, 0, !dbg !34
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !36

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !54, metadata !DIExpression()), !dbg !55
  %5 = load i8*, i8** %data, align 8, !dbg !56
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !57
  store i64 %call3, i64* %dataLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !62
  %7 = load i64, i64* %dataLen, align 8, !dbg !64
  %cmp4 = icmp ult i64 %6, %7, !dbg !65
  br i1 %cmp4, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !67
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !67
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !67
  %11 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !71
  store i8 %10, i8* %arrayidx6, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %12, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !79
  store i8 0, i8* %arrayidx7, align 1, !dbg !80
  %13 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* %13), !dbg !82
  %14 = load i8*, i8** %data, align 8, !dbg !83
  call void @free(i8* %14) #7, !dbg !84
  ret void, !dbg !85
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !119
  %tobool = icmp ne i32 %1, 0, !dbg !119
  br i1 %tobool, label %if.then1, label %if.else, !dbg !121

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end2, !dbg !124

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !138
  store i64 %call3, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !143
  %7 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp4 = icmp ult i64 %6, %7, !dbg !146
  br i1 %cmp4, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !148
  %9 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !148
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !148
  %11 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !152
  store i8 %10, i8* %arrayidx6, align 1, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %12, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !159
  store i8 0, i8* %arrayidx7, align 1, !dbg !160
  %13 = load i8*, i8** %data, align 8, !dbg !161
  call void @printLine(i8* %13), !dbg !162
  %14 = load i8*, i8** %data, align 8, !dbg !163
  call void @free(i8* %14) #7, !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !166 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !167, metadata !DIExpression()), !dbg !168
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !169
  store i8* %call, i8** %data, align 8, !dbg !170
  %0 = load i8*, i8** %data, align 8, !dbg !171
  %cmp = icmp eq i8* %0, null, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !177
  %tobool = icmp ne i32 %1, 0, !dbg !177
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !179

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !182
  %3 = load i8*, i8** %data, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !183
  store i8 0, i8* %arrayidx, align 1, !dbg !184
  br label %if.end2, !dbg !185

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !186, metadata !DIExpression()), !dbg !188
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %i, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !191, metadata !DIExpression()), !dbg !192
  %5 = load i8*, i8** %data, align 8, !dbg !193
  %call3 = call i64 @strlen(i8* %5) #9, !dbg !194
  store i64 %call3, i64* %dataLen, align 8, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %if.end2
  %6 = load i64, i64* %i, align 8, !dbg !199
  %7 = load i64, i64* %dataLen, align 8, !dbg !201
  %cmp4 = icmp ult i64 %6, %7, !dbg !202
  br i1 %cmp4, label %for.body, label %for.end, !dbg !203

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !204
  %9 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !204
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !204
  %11 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !208
  store i8 %10, i8* %arrayidx6, align 1, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !211
  %inc = add i64 %12, 1, !dbg !211
  store i64 %inc, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !215
  store i8 0, i8* %arrayidx7, align 1, !dbg !216
  %13 = load i8*, i8** %data, align 8, !dbg !217
  call void @printLine(i8* %13), !dbg !218
  %14 = load i8*, i8** %data, align 8, !dbg !219
  call void @free(i8* %14) #7, !dbg !220
  ret void, !dbg !221
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 20, scope: !21)
!27 = !DILocation(line: 33, column: 10, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 9)
!30 = !DILocation(line: 34, column: 14, scope: !29)
!31 = !DILocation(line: 34, column: 9, scope: !21)
!32 = !DILocation(line: 34, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 34, column: 23)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !13, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 9, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 21, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !13, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 42, column: 14, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !13, line: 43, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 43, column: 16, scope: !44)
!54 = !DILocalVariable(name: "dataLen", scope: !44, file: !13, line: 43, type: !50)
!55 = !DILocation(line: 43, column: 19, scope: !44)
!56 = !DILocation(line: 44, column: 26, scope: !44)
!57 = !DILocation(line: 44, column: 19, scope: !44)
!58 = !DILocation(line: 44, column: 17, scope: !44)
!59 = !DILocation(line: 46, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !13, line: 46, column: 9)
!61 = !DILocation(line: 46, column: 14, scope: !60)
!62 = !DILocation(line: 46, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !13, line: 46, column: 9)
!64 = !DILocation(line: 46, column: 25, scope: !63)
!65 = !DILocation(line: 46, column: 23, scope: !63)
!66 = !DILocation(line: 46, column: 9, scope: !60)
!67 = !DILocation(line: 48, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !13, line: 47, column: 9)
!69 = !DILocation(line: 48, column: 28, scope: !68)
!70 = !DILocation(line: 48, column: 18, scope: !68)
!71 = !DILocation(line: 48, column: 13, scope: !68)
!72 = !DILocation(line: 48, column: 21, scope: !68)
!73 = !DILocation(line: 49, column: 9, scope: !68)
!74 = !DILocation(line: 46, column: 35, scope: !63)
!75 = !DILocation(line: 46, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 49, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 50, column: 9, scope: !44)
!80 = !DILocation(line: 50, column: 20, scope: !44)
!81 = !DILocation(line: 51, column: 19, scope: !44)
!82 = !DILocation(line: 51, column: 9, scope: !44)
!83 = !DILocation(line: 52, column: 14, scope: !44)
!84 = !DILocation(line: 52, column: 9, scope: !44)
!85 = !DILocation(line: 54, column: 1, scope: !21)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_05_good", scope: !13, file: !13, line: 119, type: !22, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 121, column: 5, scope: !86)
!88 = !DILocation(line: 122, column: 5, scope: !86)
!89 = !DILocation(line: 123, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 135, type: !91, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!14, !14, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !13, line: 135, type: !14)
!95 = !DILocation(line: 135, column: 14, scope: !90)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !13, line: 135, type: !93)
!97 = !DILocation(line: 135, column: 27, scope: !90)
!98 = !DILocation(line: 138, column: 22, scope: !90)
!99 = !DILocation(line: 138, column: 12, scope: !90)
!100 = !DILocation(line: 138, column: 5, scope: !90)
!101 = !DILocation(line: 140, column: 5, scope: !90)
!102 = !DILocation(line: 141, column: 5, scope: !90)
!103 = !DILocation(line: 142, column: 5, scope: !90)
!104 = !DILocation(line: 145, column: 5, scope: !90)
!105 = !DILocation(line: 146, column: 5, scope: !90)
!106 = !DILocation(line: 147, column: 5, scope: !90)
!107 = !DILocation(line: 149, column: 5, scope: !90)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !13, line: 63, type: !6)
!110 = !DILocation(line: 63, column: 12, scope: !108)
!111 = !DILocation(line: 64, column: 20, scope: !108)
!112 = !DILocation(line: 64, column: 10, scope: !108)
!113 = !DILocation(line: 65, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !13, line: 65, column: 9)
!115 = !DILocation(line: 65, column: 14, scope: !114)
!116 = !DILocation(line: 65, column: 9, scope: !108)
!117 = !DILocation(line: 65, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !13, line: 65, column: 23)
!119 = !DILocation(line: 66, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !13, line: 66, column: 8)
!121 = !DILocation(line: 66, column: 8, scope: !108)
!122 = !DILocation(line: 69, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !13, line: 67, column: 5)
!124 = !DILocation(line: 70, column: 5, scope: !123)
!125 = !DILocation(line: 74, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !13, line: 72, column: 5)
!127 = !DILocation(line: 74, column: 9, scope: !126)
!128 = !DILocation(line: 75, column: 9, scope: !126)
!129 = !DILocation(line: 75, column: 20, scope: !126)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !13, line: 78, type: !45)
!131 = distinct !DILexicalBlock(scope: !108, file: !13, line: 77, column: 5)
!132 = !DILocation(line: 78, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !13, line: 79, type: !50)
!134 = !DILocation(line: 79, column: 16, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !13, line: 79, type: !50)
!136 = !DILocation(line: 79, column: 19, scope: !131)
!137 = !DILocation(line: 80, column: 26, scope: !131)
!138 = !DILocation(line: 80, column: 19, scope: !131)
!139 = !DILocation(line: 80, column: 17, scope: !131)
!140 = !DILocation(line: 82, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !13, line: 82, column: 9)
!142 = !DILocation(line: 82, column: 14, scope: !141)
!143 = !DILocation(line: 82, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !13, line: 82, column: 9)
!145 = !DILocation(line: 82, column: 25, scope: !144)
!146 = !DILocation(line: 82, column: 23, scope: !144)
!147 = !DILocation(line: 82, column: 9, scope: !141)
!148 = !DILocation(line: 84, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !13, line: 83, column: 9)
!150 = !DILocation(line: 84, column: 28, scope: !149)
!151 = !DILocation(line: 84, column: 18, scope: !149)
!152 = !DILocation(line: 84, column: 13, scope: !149)
!153 = !DILocation(line: 84, column: 21, scope: !149)
!154 = !DILocation(line: 85, column: 9, scope: !149)
!155 = !DILocation(line: 82, column: 35, scope: !144)
!156 = !DILocation(line: 82, column: 9, scope: !144)
!157 = distinct !{!157, !147, !158, !78}
!158 = !DILocation(line: 85, column: 9, scope: !141)
!159 = !DILocation(line: 86, column: 9, scope: !131)
!160 = !DILocation(line: 86, column: 20, scope: !131)
!161 = !DILocation(line: 87, column: 19, scope: !131)
!162 = !DILocation(line: 87, column: 9, scope: !131)
!163 = !DILocation(line: 88, column: 14, scope: !131)
!164 = !DILocation(line: 88, column: 9, scope: !131)
!165 = !DILocation(line: 90, column: 1, scope: !108)
!166 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 93, type: !22, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!167 = !DILocalVariable(name: "data", scope: !166, file: !13, line: 95, type: !6)
!168 = !DILocation(line: 95, column: 12, scope: !166)
!169 = !DILocation(line: 96, column: 20, scope: !166)
!170 = !DILocation(line: 96, column: 10, scope: !166)
!171 = !DILocation(line: 97, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !166, file: !13, line: 97, column: 9)
!173 = !DILocation(line: 97, column: 14, scope: !172)
!174 = !DILocation(line: 97, column: 9, scope: !166)
!175 = !DILocation(line: 97, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !13, line: 97, column: 23)
!177 = !DILocation(line: 98, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !166, file: !13, line: 98, column: 8)
!179 = !DILocation(line: 98, column: 8, scope: !166)
!180 = !DILocation(line: 101, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !13, line: 99, column: 5)
!182 = !DILocation(line: 101, column: 9, scope: !181)
!183 = !DILocation(line: 102, column: 9, scope: !181)
!184 = !DILocation(line: 102, column: 20, scope: !181)
!185 = !DILocation(line: 103, column: 5, scope: !181)
!186 = !DILocalVariable(name: "dest", scope: !187, file: !13, line: 105, type: !45)
!187 = distinct !DILexicalBlock(scope: !166, file: !13, line: 104, column: 5)
!188 = !DILocation(line: 105, column: 14, scope: !187)
!189 = !DILocalVariable(name: "i", scope: !187, file: !13, line: 106, type: !50)
!190 = !DILocation(line: 106, column: 16, scope: !187)
!191 = !DILocalVariable(name: "dataLen", scope: !187, file: !13, line: 106, type: !50)
!192 = !DILocation(line: 106, column: 19, scope: !187)
!193 = !DILocation(line: 107, column: 26, scope: !187)
!194 = !DILocation(line: 107, column: 19, scope: !187)
!195 = !DILocation(line: 107, column: 17, scope: !187)
!196 = !DILocation(line: 109, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !187, file: !13, line: 109, column: 9)
!198 = !DILocation(line: 109, column: 14, scope: !197)
!199 = !DILocation(line: 109, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !13, line: 109, column: 9)
!201 = !DILocation(line: 109, column: 25, scope: !200)
!202 = !DILocation(line: 109, column: 23, scope: !200)
!203 = !DILocation(line: 109, column: 9, scope: !197)
!204 = !DILocation(line: 111, column: 23, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !13, line: 110, column: 9)
!206 = !DILocation(line: 111, column: 28, scope: !205)
!207 = !DILocation(line: 111, column: 18, scope: !205)
!208 = !DILocation(line: 111, column: 13, scope: !205)
!209 = !DILocation(line: 111, column: 21, scope: !205)
!210 = !DILocation(line: 112, column: 9, scope: !205)
!211 = !DILocation(line: 109, column: 35, scope: !200)
!212 = !DILocation(line: 109, column: 9, scope: !200)
!213 = distinct !{!213, !203, !214, !78}
!214 = !DILocation(line: 112, column: 9, scope: !197)
!215 = !DILocation(line: 113, column: 9, scope: !187)
!216 = !DILocation(line: 113, column: 20, scope: !187)
!217 = !DILocation(line: 114, column: 19, scope: !187)
!218 = !DILocation(line: 114, column: 9, scope: !187)
!219 = !DILocation(line: 115, column: 14, scope: !187)
!220 = !DILocation(line: 115, column: 9, scope: !187)
!221 = !DILocation(line: 117, column: 1, scope: !166)
