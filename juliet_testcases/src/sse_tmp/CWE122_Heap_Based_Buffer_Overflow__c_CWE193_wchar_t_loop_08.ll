; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !50
  store i64 %call4, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !55
  %4 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %4, 1, !dbg !58
  %cmp5 = icmp ult i64 %3, %add, !dbg !59
  br i1 %cmp5, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !63
  %6 = load i32, i32* %arrayidx, align 4, !dbg !63
  %7 = load i32*, i32** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !64
  store i32 %6, i32* %arrayidx6, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %9, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %10), !dbg !74
  %11 = load i32*, i32** %data, align 8, !dbg !75
  %12 = bitcast i32* %11 to i8*, !dbg !75
  call void @free(i8* %12) #7, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !102 {
entry:
  ret i32 1, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  %call = call i32 @staticReturnsFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end3, !dbg !115

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !116
  %0 = bitcast i8* %call1 to i32*, !dbg !118
  store i32* %0, i32** %data, align 8, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %cmp = icmp eq i32* %1, null, !dbg !122
  br i1 %cmp, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !133
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !134
  store i64 %call4, i64* %sourceLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !139
  %4 = load i64, i64* %sourceLen, align 8, !dbg !141
  %add = add i64 %4, 1, !dbg !142
  %cmp5 = icmp ult i64 %3, %add, !dbg !143
  br i1 %cmp5, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !147
  %6 = load i32, i32* %arrayidx, align 4, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !148
  store i32 %6, i32* %arrayidx6, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %9, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %10), !dbg !157
  %11 = load i32*, i32** %data, align 8, !dbg !158
  %12 = bitcast i32* %11 to i8*, !dbg !158
  call void @free(i8* %12) #7, !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !161 {
entry:
  ret i32 0, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !163 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !164, metadata !DIExpression()), !dbg !165
  store i32* null, i32** %data, align 8, !dbg !166
  %call = call i32 @staticReturnsTrue(), !dbg !167
  %tobool = icmp ne i32 %call, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end3, !dbg !169

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !170
  %0 = bitcast i8* %call1 to i32*, !dbg !172
  store i32* %0, i32** %data, align 8, !dbg !173
  %1 = load i32*, i32** %data, align 8, !dbg !174
  %cmp = icmp eq i32* %1, null, !dbg !176
  br i1 %cmp, label %if.then2, label %if.end, !dbg !177

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !178
  unreachable, !dbg !178

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !180

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !181, metadata !DIExpression()), !dbg !183
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !183
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !183
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !188
  %call4 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !189
  store i64 %call4, i64* %sourceLen, align 8, !dbg !190
  store i64 0, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !193

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !194
  %4 = load i64, i64* %sourceLen, align 8, !dbg !196
  %add = add i64 %4, 1, !dbg !197
  %cmp5 = icmp ult i64 %3, %add, !dbg !198
  br i1 %cmp5, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !202
  %6 = load i32, i32* %arrayidx, align 4, !dbg !202
  %7 = load i32*, i32** %data, align 8, !dbg !203
  %8 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !203
  store i32 %6, i32* %arrayidx6, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %9, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* %10), !dbg !212
  %11 = load i32*, i32** %data, align 8, !dbg !213
  %12 = bitcast i32* %11 to i8*, !dbg !213
  call void @free(i8* %12) #7, !dbg !214
  ret void, !dbg !215
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_bad", scope: !17, file: !17, line: 42, type: !18, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 44, type: !4)
!21 = !DILocation(line: 44, column: 15, scope: !16)
!22 = !DILocation(line: 45, column: 10, scope: !16)
!23 = !DILocation(line: 46, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 46, column: 8)
!25 = !DILocation(line: 46, column: 8, scope: !16)
!26 = !DILocation(line: 49, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 47, column: 5)
!28 = !DILocation(line: 49, column: 16, scope: !27)
!29 = !DILocation(line: 49, column: 14, scope: !27)
!30 = !DILocation(line: 50, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 50, column: 13)
!32 = !DILocation(line: 50, column: 18, scope: !31)
!33 = !DILocation(line: 50, column: 13, scope: !27)
!34 = !DILocation(line: 50, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 50, column: 27)
!36 = !DILocation(line: 51, column: 5, scope: !27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 53, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 52, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 53, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !17, line: 54, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 54, column: 16, scope: !38)
!47 = !DILocalVariable(name: "sourceLen", scope: !38, file: !17, line: 54, type: !44)
!48 = !DILocation(line: 54, column: 19, scope: !38)
!49 = !DILocation(line: 55, column: 28, scope: !38)
!50 = !DILocation(line: 55, column: 21, scope: !38)
!51 = !DILocation(line: 55, column: 19, scope: !38)
!52 = !DILocation(line: 58, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !17, line: 58, column: 9)
!54 = !DILocation(line: 58, column: 14, scope: !53)
!55 = !DILocation(line: 58, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !17, line: 58, column: 9)
!57 = !DILocation(line: 58, column: 25, scope: !56)
!58 = !DILocation(line: 58, column: 35, scope: !56)
!59 = !DILocation(line: 58, column: 23, scope: !56)
!60 = !DILocation(line: 58, column: 9, scope: !53)
!61 = !DILocation(line: 60, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !17, line: 59, column: 9)
!63 = !DILocation(line: 60, column: 23, scope: !62)
!64 = !DILocation(line: 60, column: 13, scope: !62)
!65 = !DILocation(line: 60, column: 18, scope: !62)
!66 = !DILocation(line: 60, column: 21, scope: !62)
!67 = !DILocation(line: 61, column: 9, scope: !62)
!68 = !DILocation(line: 58, column: 41, scope: !56)
!69 = !DILocation(line: 58, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 61, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 62, column: 20, scope: !38)
!74 = !DILocation(line: 62, column: 9, scope: !38)
!75 = !DILocation(line: 63, column: 14, scope: !38)
!76 = !DILocation(line: 63, column: 9, scope: !38)
!77 = !DILocation(line: 65, column: 1, scope: !16)
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_08_good", scope: !17, file: !17, line: 128, type: !18, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 130, column: 5, scope: !78)
!80 = !DILocation(line: 131, column: 5, scope: !78)
!81 = !DILocation(line: 132, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 144, type: !83, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7, !7, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !17, line: 144, type: !7)
!89 = !DILocation(line: 144, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !17, line: 144, type: !85)
!91 = !DILocation(line: 144, column: 27, scope: !82)
!92 = !DILocation(line: 147, column: 22, scope: !82)
!93 = !DILocation(line: 147, column: 12, scope: !82)
!94 = !DILocation(line: 147, column: 5, scope: !82)
!95 = !DILocation(line: 149, column: 5, scope: !82)
!96 = !DILocation(line: 150, column: 5, scope: !82)
!97 = !DILocation(line: 151, column: 5, scope: !82)
!98 = !DILocation(line: 154, column: 5, scope: !82)
!99 = !DILocation(line: 155, column: 5, scope: !82)
!100 = !DILocation(line: 156, column: 5, scope: !82)
!101 = !DILocation(line: 158, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 30, type: !103, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!7}
!105 = !DILocation(line: 32, column: 5, scope: !102)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 74, type: !4)
!108 = !DILocation(line: 74, column: 15, scope: !106)
!109 = !DILocation(line: 75, column: 10, scope: !106)
!110 = !DILocation(line: 76, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !17, line: 76, column: 8)
!112 = !DILocation(line: 76, column: 8, scope: !106)
!113 = !DILocation(line: 79, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !17, line: 77, column: 5)
!115 = !DILocation(line: 80, column: 5, scope: !114)
!116 = !DILocation(line: 84, column: 27, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !17, line: 82, column: 5)
!118 = !DILocation(line: 84, column: 16, scope: !117)
!119 = !DILocation(line: 84, column: 14, scope: !117)
!120 = !DILocation(line: 85, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 85, column: 13)
!122 = !DILocation(line: 85, column: 18, scope: !121)
!123 = !DILocation(line: 85, column: 13, scope: !117)
!124 = !DILocation(line: 85, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !17, line: 85, column: 27)
!126 = !DILocalVariable(name: "source", scope: !127, file: !17, line: 88, type: !39)
!127 = distinct !DILexicalBlock(scope: !106, file: !17, line: 87, column: 5)
!128 = !DILocation(line: 88, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !17, line: 89, type: !44)
!130 = !DILocation(line: 89, column: 16, scope: !127)
!131 = !DILocalVariable(name: "sourceLen", scope: !127, file: !17, line: 89, type: !44)
!132 = !DILocation(line: 89, column: 19, scope: !127)
!133 = !DILocation(line: 90, column: 28, scope: !127)
!134 = !DILocation(line: 90, column: 21, scope: !127)
!135 = !DILocation(line: 90, column: 19, scope: !127)
!136 = !DILocation(line: 93, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !17, line: 93, column: 9)
!138 = !DILocation(line: 93, column: 14, scope: !137)
!139 = !DILocation(line: 93, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 93, column: 9)
!141 = !DILocation(line: 93, column: 25, scope: !140)
!142 = !DILocation(line: 93, column: 35, scope: !140)
!143 = !DILocation(line: 93, column: 23, scope: !140)
!144 = !DILocation(line: 93, column: 9, scope: !137)
!145 = !DILocation(line: 95, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !17, line: 94, column: 9)
!147 = !DILocation(line: 95, column: 23, scope: !146)
!148 = !DILocation(line: 95, column: 13, scope: !146)
!149 = !DILocation(line: 95, column: 18, scope: !146)
!150 = !DILocation(line: 95, column: 21, scope: !146)
!151 = !DILocation(line: 96, column: 9, scope: !146)
!152 = !DILocation(line: 93, column: 41, scope: !140)
!153 = !DILocation(line: 93, column: 9, scope: !140)
!154 = distinct !{!154, !144, !155, !72}
!155 = !DILocation(line: 96, column: 9, scope: !137)
!156 = !DILocation(line: 97, column: 20, scope: !127)
!157 = !DILocation(line: 97, column: 9, scope: !127)
!158 = !DILocation(line: 98, column: 14, scope: !127)
!159 = !DILocation(line: 98, column: 9, scope: !127)
!160 = !DILocation(line: 100, column: 1, scope: !106)
!161 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 35, type: !103, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocation(line: 37, column: 5, scope: !161)
!163 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 103, type: !18, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocalVariable(name: "data", scope: !163, file: !17, line: 105, type: !4)
!165 = !DILocation(line: 105, column: 15, scope: !163)
!166 = !DILocation(line: 106, column: 10, scope: !163)
!167 = !DILocation(line: 107, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !17, line: 107, column: 8)
!169 = !DILocation(line: 107, column: 8, scope: !163)
!170 = !DILocation(line: 110, column: 27, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !17, line: 108, column: 5)
!172 = !DILocation(line: 110, column: 16, scope: !171)
!173 = !DILocation(line: 110, column: 14, scope: !171)
!174 = !DILocation(line: 111, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !17, line: 111, column: 13)
!176 = !DILocation(line: 111, column: 18, scope: !175)
!177 = !DILocation(line: 111, column: 13, scope: !171)
!178 = !DILocation(line: 111, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !17, line: 111, column: 27)
!180 = !DILocation(line: 112, column: 5, scope: !171)
!181 = !DILocalVariable(name: "source", scope: !182, file: !17, line: 114, type: !39)
!182 = distinct !DILexicalBlock(scope: !163, file: !17, line: 113, column: 5)
!183 = !DILocation(line: 114, column: 17, scope: !182)
!184 = !DILocalVariable(name: "i", scope: !182, file: !17, line: 115, type: !44)
!185 = !DILocation(line: 115, column: 16, scope: !182)
!186 = !DILocalVariable(name: "sourceLen", scope: !182, file: !17, line: 115, type: !44)
!187 = !DILocation(line: 115, column: 19, scope: !182)
!188 = !DILocation(line: 116, column: 28, scope: !182)
!189 = !DILocation(line: 116, column: 21, scope: !182)
!190 = !DILocation(line: 116, column: 19, scope: !182)
!191 = !DILocation(line: 119, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !182, file: !17, line: 119, column: 9)
!193 = !DILocation(line: 119, column: 14, scope: !192)
!194 = !DILocation(line: 119, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !17, line: 119, column: 9)
!196 = !DILocation(line: 119, column: 25, scope: !195)
!197 = !DILocation(line: 119, column: 35, scope: !195)
!198 = !DILocation(line: 119, column: 23, scope: !195)
!199 = !DILocation(line: 119, column: 9, scope: !192)
!200 = !DILocation(line: 121, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !17, line: 120, column: 9)
!202 = !DILocation(line: 121, column: 23, scope: !201)
!203 = !DILocation(line: 121, column: 13, scope: !201)
!204 = !DILocation(line: 121, column: 18, scope: !201)
!205 = !DILocation(line: 121, column: 21, scope: !201)
!206 = !DILocation(line: 122, column: 9, scope: !201)
!207 = !DILocation(line: 119, column: 41, scope: !195)
!208 = !DILocation(line: 119, column: 9, scope: !195)
!209 = distinct !{!209, !199, !210, !72}
!210 = !DILocation(line: 122, column: 9, scope: !192)
!211 = !DILocation(line: 123, column: 20, scope: !182)
!212 = !DILocation(line: 123, column: 9, scope: !182)
!213 = !DILocation(line: 124, column: 14, scope: !182)
!214 = !DILocation(line: 124, column: 9, scope: !182)
!215 = !DILocation(line: 126, column: 1, scope: !163)
