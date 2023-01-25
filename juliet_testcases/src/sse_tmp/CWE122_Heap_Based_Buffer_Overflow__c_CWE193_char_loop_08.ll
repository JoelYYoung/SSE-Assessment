; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !48
  store i64 %call4, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !53
  %3 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %3, 1, !dbg !56
  %cmp5 = icmp ult i64 %2, %add, !dbg !57
  br i1 %cmp5, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !61
  %5 = load i8, i8* %arrayidx, align 1, !dbg !61
  %6 = load i8*, i8** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !62
  store i8 %5, i8* %arrayidx6, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %9), !dbg !72
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* %10) #7, !dbg !74
  ret void, !dbg !75
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
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !99 {
entry:
  ret i32 1, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call i32 @staticReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end3, !dbg !112

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !113
  store i8* %call1, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !130
  store i64 %call4, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !135
  %3 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %3, 1, !dbg !138
  %cmp5 = icmp ult i64 %2, %add, !dbg !139
  br i1 %cmp5, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !143
  %5 = load i8, i8* %arrayidx, align 1, !dbg !143
  %6 = load i8*, i8** %data, align 8, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !144
  store i8 %5, i8* %arrayidx6, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %8, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %9), !dbg !153
  %10 = load i8*, i8** %data, align 8, !dbg !154
  call void @free(i8* %10) #7, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !157 {
entry:
  ret i32 0, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !160, metadata !DIExpression()), !dbg !161
  store i8* null, i8** %data, align 8, !dbg !162
  %call = call i32 @staticReturnsTrue(), !dbg !163
  %tobool = icmp ne i32 %call, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end3, !dbg !165

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !166
  store i8* %call1, i8** %data, align 8, !dbg !168
  %0 = load i8*, i8** %data, align 8, !dbg !169
  %cmp = icmp eq i8* %0, null, !dbg !171
  br i1 %cmp, label %if.then2, label %if.end, !dbg !172

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !175

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !176, metadata !DIExpression()), !dbg !178
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !181, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !183
  %call4 = call i64 @strlen(i8* %arraydecay) #9, !dbg !184
  store i64 %call4, i64* %sourceLen, align 8, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !189
  %3 = load i64, i64* %sourceLen, align 8, !dbg !191
  %add = add i64 %3, 1, !dbg !192
  %cmp5 = icmp ult i64 %2, %add, !dbg !193
  br i1 %cmp5, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !197
  %5 = load i8, i8* %arrayidx, align 1, !dbg !197
  %6 = load i8*, i8** %data, align 8, !dbg !198
  %7 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !198
  store i8 %5, i8* %arrayidx6, align 1, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %8, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !206
  call void @printLine(i8* %9), !dbg !207
  %10 = load i8*, i8** %data, align 8, !dbg !208
  call void @free(i8* %10) #7, !dbg !209
  ret void, !dbg !210
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
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_bad", scope: !15, file: !15, line: 42, type: !16, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 44, type: !4)
!19 = !DILocation(line: 44, column: 12, scope: !14)
!20 = !DILocation(line: 45, column: 10, scope: !14)
!21 = !DILocation(line: 46, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 8)
!23 = !DILocation(line: 46, column: 8, scope: !14)
!24 = !DILocation(line: 49, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!26 = !DILocation(line: 49, column: 14, scope: !25)
!27 = !DILocation(line: 50, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 50, column: 13)
!29 = !DILocation(line: 50, column: 18, scope: !28)
!30 = !DILocation(line: 50, column: 13, scope: !25)
!31 = !DILocation(line: 50, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 50, column: 27)
!33 = !DILocation(line: 51, column: 5, scope: !25)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 53, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 53, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 54, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 54, column: 16, scope: !35)
!45 = !DILocalVariable(name: "sourceLen", scope: !35, file: !15, line: 54, type: !41)
!46 = !DILocation(line: 54, column: 19, scope: !35)
!47 = !DILocation(line: 55, column: 28, scope: !35)
!48 = !DILocation(line: 55, column: 21, scope: !35)
!49 = !DILocation(line: 55, column: 19, scope: !35)
!50 = !DILocation(line: 58, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !15, line: 58, column: 9)
!52 = !DILocation(line: 58, column: 14, scope: !51)
!53 = !DILocation(line: 58, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 58, column: 9)
!55 = !DILocation(line: 58, column: 25, scope: !54)
!56 = !DILocation(line: 58, column: 35, scope: !54)
!57 = !DILocation(line: 58, column: 23, scope: !54)
!58 = !DILocation(line: 58, column: 9, scope: !51)
!59 = !DILocation(line: 60, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !15, line: 59, column: 9)
!61 = !DILocation(line: 60, column: 23, scope: !60)
!62 = !DILocation(line: 60, column: 13, scope: !60)
!63 = !DILocation(line: 60, column: 18, scope: !60)
!64 = !DILocation(line: 60, column: 21, scope: !60)
!65 = !DILocation(line: 61, column: 9, scope: !60)
!66 = !DILocation(line: 58, column: 41, scope: !54)
!67 = !DILocation(line: 58, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 61, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 62, column: 19, scope: !35)
!72 = !DILocation(line: 62, column: 9, scope: !35)
!73 = !DILocation(line: 63, column: 14, scope: !35)
!74 = !DILocation(line: 63, column: 9, scope: !35)
!75 = !DILocation(line: 65, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_08_good", scope: !15, file: !15, line: 128, type: !16, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 130, column: 5, scope: !76)
!78 = !DILocation(line: 131, column: 5, scope: !76)
!79 = !DILocation(line: 132, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !81, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 144, type: !83)
!86 = !DILocation(line: 144, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 144, type: !84)
!88 = !DILocation(line: 144, column: 27, scope: !80)
!89 = !DILocation(line: 147, column: 22, scope: !80)
!90 = !DILocation(line: 147, column: 12, scope: !80)
!91 = !DILocation(line: 147, column: 5, scope: !80)
!92 = !DILocation(line: 149, column: 5, scope: !80)
!93 = !DILocation(line: 150, column: 5, scope: !80)
!94 = !DILocation(line: 151, column: 5, scope: !80)
!95 = !DILocation(line: 154, column: 5, scope: !80)
!96 = !DILocation(line: 155, column: 5, scope: !80)
!97 = !DILocation(line: 156, column: 5, scope: !80)
!98 = !DILocation(line: 158, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 30, type: !100, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!83}
!102 = !DILocation(line: 32, column: 5, scope: !99)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 74, type: !4)
!105 = !DILocation(line: 74, column: 12, scope: !103)
!106 = !DILocation(line: 75, column: 10, scope: !103)
!107 = !DILocation(line: 76, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !15, line: 76, column: 8)
!109 = !DILocation(line: 76, column: 8, scope: !103)
!110 = !DILocation(line: 79, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !15, line: 77, column: 5)
!112 = !DILocation(line: 80, column: 5, scope: !111)
!113 = !DILocation(line: 84, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 82, column: 5)
!115 = !DILocation(line: 84, column: 14, scope: !114)
!116 = !DILocation(line: 85, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !15, line: 85, column: 13)
!118 = !DILocation(line: 85, column: 18, scope: !117)
!119 = !DILocation(line: 85, column: 13, scope: !114)
!120 = !DILocation(line: 85, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 85, column: 27)
!122 = !DILocalVariable(name: "source", scope: !123, file: !15, line: 88, type: !36)
!123 = distinct !DILexicalBlock(scope: !103, file: !15, line: 87, column: 5)
!124 = !DILocation(line: 88, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 89, type: !41)
!126 = !DILocation(line: 89, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !15, line: 89, type: !41)
!128 = !DILocation(line: 89, column: 19, scope: !123)
!129 = !DILocation(line: 90, column: 28, scope: !123)
!130 = !DILocation(line: 90, column: 21, scope: !123)
!131 = !DILocation(line: 90, column: 19, scope: !123)
!132 = !DILocation(line: 93, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !15, line: 93, column: 9)
!134 = !DILocation(line: 93, column: 14, scope: !133)
!135 = !DILocation(line: 93, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 93, column: 9)
!137 = !DILocation(line: 93, column: 25, scope: !136)
!138 = !DILocation(line: 93, column: 35, scope: !136)
!139 = !DILocation(line: 93, column: 23, scope: !136)
!140 = !DILocation(line: 93, column: 9, scope: !133)
!141 = !DILocation(line: 95, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !15, line: 94, column: 9)
!143 = !DILocation(line: 95, column: 23, scope: !142)
!144 = !DILocation(line: 95, column: 13, scope: !142)
!145 = !DILocation(line: 95, column: 18, scope: !142)
!146 = !DILocation(line: 95, column: 21, scope: !142)
!147 = !DILocation(line: 96, column: 9, scope: !142)
!148 = !DILocation(line: 93, column: 41, scope: !136)
!149 = !DILocation(line: 93, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !70}
!151 = !DILocation(line: 96, column: 9, scope: !133)
!152 = !DILocation(line: 97, column: 19, scope: !123)
!153 = !DILocation(line: 97, column: 9, scope: !123)
!154 = !DILocation(line: 98, column: 14, scope: !123)
!155 = !DILocation(line: 98, column: 9, scope: !123)
!156 = !DILocation(line: 100, column: 1, scope: !103)
!157 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 35, type: !100, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocation(line: 37, column: 5, scope: !157)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !15, line: 105, type: !4)
!161 = !DILocation(line: 105, column: 12, scope: !159)
!162 = !DILocation(line: 106, column: 10, scope: !159)
!163 = !DILocation(line: 107, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !15, line: 107, column: 8)
!165 = !DILocation(line: 107, column: 8, scope: !159)
!166 = !DILocation(line: 110, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 108, column: 5)
!168 = !DILocation(line: 110, column: 14, scope: !167)
!169 = !DILocation(line: 111, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 111, column: 13)
!171 = !DILocation(line: 111, column: 18, scope: !170)
!172 = !DILocation(line: 111, column: 13, scope: !167)
!173 = !DILocation(line: 111, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 111, column: 27)
!175 = !DILocation(line: 112, column: 5, scope: !167)
!176 = !DILocalVariable(name: "source", scope: !177, file: !15, line: 114, type: !36)
!177 = distinct !DILexicalBlock(scope: !159, file: !15, line: 113, column: 5)
!178 = !DILocation(line: 114, column: 14, scope: !177)
!179 = !DILocalVariable(name: "i", scope: !177, file: !15, line: 115, type: !41)
!180 = !DILocation(line: 115, column: 16, scope: !177)
!181 = !DILocalVariable(name: "sourceLen", scope: !177, file: !15, line: 115, type: !41)
!182 = !DILocation(line: 115, column: 19, scope: !177)
!183 = !DILocation(line: 116, column: 28, scope: !177)
!184 = !DILocation(line: 116, column: 21, scope: !177)
!185 = !DILocation(line: 116, column: 19, scope: !177)
!186 = !DILocation(line: 119, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !177, file: !15, line: 119, column: 9)
!188 = !DILocation(line: 119, column: 14, scope: !187)
!189 = !DILocation(line: 119, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 119, column: 9)
!191 = !DILocation(line: 119, column: 25, scope: !190)
!192 = !DILocation(line: 119, column: 35, scope: !190)
!193 = !DILocation(line: 119, column: 23, scope: !190)
!194 = !DILocation(line: 119, column: 9, scope: !187)
!195 = !DILocation(line: 121, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !190, file: !15, line: 120, column: 9)
!197 = !DILocation(line: 121, column: 23, scope: !196)
!198 = !DILocation(line: 121, column: 13, scope: !196)
!199 = !DILocation(line: 121, column: 18, scope: !196)
!200 = !DILocation(line: 121, column: 21, scope: !196)
!201 = !DILocation(line: 122, column: 9, scope: !196)
!202 = !DILocation(line: 119, column: 41, scope: !190)
!203 = !DILocation(line: 119, column: 9, scope: !190)
!204 = distinct !{!204, !194, !205, !70}
!205 = !DILocation(line: 122, column: 9, scope: !187)
!206 = !DILocation(line: 123, column: 19, scope: !177)
!207 = !DILocation(line: 123, column: 9, scope: !177)
!208 = !DILocation(line: 124, column: 14, scope: !177)
!209 = !DILocation(line: 124, column: 9, scope: !177)
!210 = !DILocation(line: 126, column: 1, scope: !159)
