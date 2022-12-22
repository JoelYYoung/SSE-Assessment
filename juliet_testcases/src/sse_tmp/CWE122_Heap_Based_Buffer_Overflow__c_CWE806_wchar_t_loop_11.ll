; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !53
  store i64 %call5, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !58
  %7 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp6 = icmp ult i64 %6, %7, !dbg !61
  br i1 %cmp6, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !63
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !67
  store i32 %10, i32* %arrayidx8, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %12, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !75
  store i32 0, i32* %arrayidx9, align 4, !dbg !76
  %13 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %13), !dbg !78
  %14 = load i32*, i32** %data, align 8, !dbg !79
  %15 = bitcast i32* %14 to i8*, !dbg !79
  call void @free(i8* %15) #7, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @globalReturnsTrue(...) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !109
  %0 = bitcast i8* %call to i32*, !dbg !110
  store i32* %0, i32** %data, align 8, !dbg !111
  %1 = load i32*, i32** %data, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !118
  %tobool = icmp ne i32 %call1, 0, !dbg !118
  br i1 %tobool, label %if.then2, label %if.else, !dbg !120

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end4, !dbg !123

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !126
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !137
  store i64 %call5, i64* %dataLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !142
  %7 = load i64, i64* %dataLen, align 8, !dbg !144
  %cmp6 = icmp ult i64 %6, %7, !dbg !145
  br i1 %cmp6, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !147
  %9 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !147
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !147
  %11 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !151
  store i32 %10, i32* %arrayidx8, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %12, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !158
  store i32 0, i32* %arrayidx9, align 4, !dbg !159
  %13 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* %13), !dbg !161
  %14 = load i32*, i32** %data, align 8, !dbg !162
  %15 = bitcast i32* %14 to i8*, !dbg !162
  call void @free(i8* %15) #7, !dbg !163
  ret void, !dbg !164
}

declare dso_local i32 @globalReturnsFalse(...) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !166, metadata !DIExpression()), !dbg !167
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !168
  %0 = bitcast i8* %call to i32*, !dbg !169
  store i32* %0, i32** %data, align 8, !dbg !170
  %1 = load i32*, i32** %data, align 8, !dbg !171
  %cmp = icmp eq i32* %1, null, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !177
  %tobool = icmp ne i32 %call1, 0, !dbg !177
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !179

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !180
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !182
  %3 = load i32*, i32** %data, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !183
  store i32 0, i32* %arrayidx, align 4, !dbg !184
  br label %if.end4, !dbg !185

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !186, metadata !DIExpression()), !dbg !188
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !188
  call void @llvm.dbg.declare(metadata i64* %i, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !191, metadata !DIExpression()), !dbg !192
  %5 = load i32*, i32** %data, align 8, !dbg !193
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !194
  store i64 %call5, i64* %dataLen, align 8, !dbg !195
  store i64 0, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !198

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !199
  %7 = load i64, i64* %dataLen, align 8, !dbg !201
  %cmp6 = icmp ult i64 %6, %7, !dbg !202
  br i1 %cmp6, label %for.body, label %for.end, !dbg !203

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !204
  %9 = load i64, i64* %i, align 8, !dbg !206
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !204
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !204
  %11 = load i64, i64* %i, align 8, !dbg !207
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !208
  store i32 %10, i32* %arrayidx8, align 4, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !211
  %inc = add i64 %12, 1, !dbg !211
  store i64 %inc, i64* %i, align 8, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !215
  store i32 0, i32* %arrayidx9, align 4, !dbg !216
  %13 = load i32*, i32** %data, align 8, !dbg !217
  call void @printWLine(i32* %13), !dbg !218
  %14 = load i32*, i32** %data, align 8, !dbg !219
  %15 = bitcast i32* %14 to i8*, !dbg !219
  call void @free(i8* %15) #7, !dbg !220
  ret void, !dbg !221
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !16)
!34 = !DILocation(line: 31, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!36 = !DILocation(line: 31, column: 9, scope: !35)
!37 = !DILocation(line: 32, column: 9, scope: !35)
!38 = !DILocation(line: 32, column: 21, scope: !35)
!39 = !DILocation(line: 33, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 35, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !17, line: 36, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 36, column: 16, scope: !41)
!50 = !DILocalVariable(name: "dataLen", scope: !41, file: !17, line: 36, type: !47)
!51 = !DILocation(line: 36, column: 19, scope: !41)
!52 = !DILocation(line: 37, column: 26, scope: !41)
!53 = !DILocation(line: 37, column: 19, scope: !41)
!54 = !DILocation(line: 37, column: 17, scope: !41)
!55 = !DILocation(line: 39, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !41, file: !17, line: 39, column: 9)
!57 = !DILocation(line: 39, column: 14, scope: !56)
!58 = !DILocation(line: 39, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 39, column: 9)
!60 = !DILocation(line: 39, column: 25, scope: !59)
!61 = !DILocation(line: 39, column: 23, scope: !59)
!62 = !DILocation(line: 39, column: 9, scope: !56)
!63 = !DILocation(line: 41, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !17, line: 40, column: 9)
!65 = !DILocation(line: 41, column: 28, scope: !64)
!66 = !DILocation(line: 41, column: 18, scope: !64)
!67 = !DILocation(line: 41, column: 13, scope: !64)
!68 = !DILocation(line: 41, column: 21, scope: !64)
!69 = !DILocation(line: 42, column: 9, scope: !64)
!70 = !DILocation(line: 39, column: 35, scope: !59)
!71 = !DILocation(line: 39, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 42, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 43, column: 9, scope: !41)
!76 = !DILocation(line: 43, column: 20, scope: !41)
!77 = !DILocation(line: 44, column: 20, scope: !41)
!78 = !DILocation(line: 44, column: 9, scope: !41)
!79 = !DILocation(line: 45, column: 14, scope: !41)
!80 = !DILocation(line: 45, column: 9, scope: !41)
!81 = !DILocation(line: 47, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 114, column: 5, scope: !82)
!84 = !DILocation(line: 115, column: 5, scope: !82)
!85 = !DILocation(line: 116, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 128, type: !87, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !17, line: 128, type: !7)
!93 = !DILocation(line: 128, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !17, line: 128, type: !89)
!95 = !DILocation(line: 128, column: 27, scope: !86)
!96 = !DILocation(line: 131, column: 22, scope: !86)
!97 = !DILocation(line: 131, column: 12, scope: !86)
!98 = !DILocation(line: 131, column: 5, scope: !86)
!99 = !DILocation(line: 133, column: 5, scope: !86)
!100 = !DILocation(line: 134, column: 5, scope: !86)
!101 = !DILocation(line: 135, column: 5, scope: !86)
!102 = !DILocation(line: 138, column: 5, scope: !86)
!103 = !DILocation(line: 139, column: 5, scope: !86)
!104 = !DILocation(line: 140, column: 5, scope: !86)
!105 = !DILocation(line: 142, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 56, type: !4)
!108 = !DILocation(line: 56, column: 15, scope: !106)
!109 = !DILocation(line: 57, column: 23, scope: !106)
!110 = !DILocation(line: 57, column: 12, scope: !106)
!111 = !DILocation(line: 57, column: 10, scope: !106)
!112 = !DILocation(line: 58, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !17, line: 58, column: 9)
!114 = !DILocation(line: 58, column: 14, scope: !113)
!115 = !DILocation(line: 58, column: 9, scope: !106)
!116 = !DILocation(line: 58, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 58, column: 23)
!118 = !DILocation(line: 59, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !106, file: !17, line: 59, column: 8)
!120 = !DILocation(line: 59, column: 8, scope: !106)
!121 = !DILocation(line: 62, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !17, line: 60, column: 5)
!123 = !DILocation(line: 63, column: 5, scope: !122)
!124 = !DILocation(line: 67, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !17, line: 65, column: 5)
!126 = !DILocation(line: 67, column: 9, scope: !125)
!127 = !DILocation(line: 68, column: 9, scope: !125)
!128 = !DILocation(line: 68, column: 20, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !17, line: 71, type: !42)
!130 = distinct !DILexicalBlock(scope: !106, file: !17, line: 70, column: 5)
!131 = !DILocation(line: 71, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !17, line: 72, type: !47)
!133 = !DILocation(line: 72, column: 16, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !130, file: !17, line: 72, type: !47)
!135 = !DILocation(line: 72, column: 19, scope: !130)
!136 = !DILocation(line: 73, column: 26, scope: !130)
!137 = !DILocation(line: 73, column: 19, scope: !130)
!138 = !DILocation(line: 73, column: 17, scope: !130)
!139 = !DILocation(line: 75, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !17, line: 75, column: 9)
!141 = !DILocation(line: 75, column: 14, scope: !140)
!142 = !DILocation(line: 75, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !17, line: 75, column: 9)
!144 = !DILocation(line: 75, column: 25, scope: !143)
!145 = !DILocation(line: 75, column: 23, scope: !143)
!146 = !DILocation(line: 75, column: 9, scope: !140)
!147 = !DILocation(line: 77, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !17, line: 76, column: 9)
!149 = !DILocation(line: 77, column: 28, scope: !148)
!150 = !DILocation(line: 77, column: 18, scope: !148)
!151 = !DILocation(line: 77, column: 13, scope: !148)
!152 = !DILocation(line: 77, column: 21, scope: !148)
!153 = !DILocation(line: 78, column: 9, scope: !148)
!154 = !DILocation(line: 75, column: 35, scope: !143)
!155 = !DILocation(line: 75, column: 9, scope: !143)
!156 = distinct !{!156, !146, !157, !74}
!157 = !DILocation(line: 78, column: 9, scope: !140)
!158 = !DILocation(line: 79, column: 9, scope: !130)
!159 = !DILocation(line: 79, column: 20, scope: !130)
!160 = !DILocation(line: 80, column: 20, scope: !130)
!161 = !DILocation(line: 80, column: 9, scope: !130)
!162 = !DILocation(line: 81, column: 14, scope: !130)
!163 = !DILocation(line: 81, column: 9, scope: !130)
!164 = !DILocation(line: 83, column: 1, scope: !106)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocalVariable(name: "data", scope: !165, file: !17, line: 88, type: !4)
!167 = !DILocation(line: 88, column: 15, scope: !165)
!168 = !DILocation(line: 89, column: 23, scope: !165)
!169 = !DILocation(line: 89, column: 12, scope: !165)
!170 = !DILocation(line: 89, column: 10, scope: !165)
!171 = !DILocation(line: 90, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !17, line: 90, column: 9)
!173 = !DILocation(line: 90, column: 14, scope: !172)
!174 = !DILocation(line: 90, column: 9, scope: !165)
!175 = !DILocation(line: 90, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !17, line: 90, column: 23)
!177 = !DILocation(line: 91, column: 8, scope: !178)
!178 = distinct !DILexicalBlock(scope: !165, file: !17, line: 91, column: 8)
!179 = !DILocation(line: 91, column: 8, scope: !165)
!180 = !DILocation(line: 94, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !17, line: 92, column: 5)
!182 = !DILocation(line: 94, column: 9, scope: !181)
!183 = !DILocation(line: 95, column: 9, scope: !181)
!184 = !DILocation(line: 95, column: 20, scope: !181)
!185 = !DILocation(line: 96, column: 5, scope: !181)
!186 = !DILocalVariable(name: "dest", scope: !187, file: !17, line: 98, type: !42)
!187 = distinct !DILexicalBlock(scope: !165, file: !17, line: 97, column: 5)
!188 = !DILocation(line: 98, column: 17, scope: !187)
!189 = !DILocalVariable(name: "i", scope: !187, file: !17, line: 99, type: !47)
!190 = !DILocation(line: 99, column: 16, scope: !187)
!191 = !DILocalVariable(name: "dataLen", scope: !187, file: !17, line: 99, type: !47)
!192 = !DILocation(line: 99, column: 19, scope: !187)
!193 = !DILocation(line: 100, column: 26, scope: !187)
!194 = !DILocation(line: 100, column: 19, scope: !187)
!195 = !DILocation(line: 100, column: 17, scope: !187)
!196 = !DILocation(line: 102, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !187, file: !17, line: 102, column: 9)
!198 = !DILocation(line: 102, column: 14, scope: !197)
!199 = !DILocation(line: 102, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !17, line: 102, column: 9)
!201 = !DILocation(line: 102, column: 25, scope: !200)
!202 = !DILocation(line: 102, column: 23, scope: !200)
!203 = !DILocation(line: 102, column: 9, scope: !197)
!204 = !DILocation(line: 104, column: 23, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !17, line: 103, column: 9)
!206 = !DILocation(line: 104, column: 28, scope: !205)
!207 = !DILocation(line: 104, column: 18, scope: !205)
!208 = !DILocation(line: 104, column: 13, scope: !205)
!209 = !DILocation(line: 104, column: 21, scope: !205)
!210 = !DILocation(line: 105, column: 9, scope: !205)
!211 = !DILocation(line: 102, column: 35, scope: !200)
!212 = !DILocation(line: 102, column: 9, scope: !200)
!213 = distinct !{!213, !203, !214, !74}
!214 = !DILocation(line: 105, column: 9, scope: !197)
!215 = !DILocation(line: 106, column: 9, scope: !187)
!216 = !DILocation(line: 106, column: 20, scope: !187)
!217 = !DILocation(line: 107, column: 20, scope: !187)
!218 = !DILocation(line: 107, column: 9, scope: !187)
!219 = !DILocation(line: 108, column: 14, scope: !187)
!220 = !DILocation(line: 108, column: 9, scope: !187)
!221 = !DILocation(line: 110, column: 1, scope: !165)
