; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end2, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end2, !dbg !43

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !61
  %cmp5 = icmp ult i64 %4, 100, !dbg !63
  br i1 %cmp5, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !67
  %6 = load i32, i32* %arrayidx6, align 4, !dbg !67
  %7 = load i32*, i32** %data, align 8, !dbg !68
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !68
  store i32 %6, i32* %arrayidx7, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !77
  store i32 0, i32* %arrayidx8, align 4, !dbg !78
  %11 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %11), !dbg !80
  %12 = load i32*, i32** %data, align 8, !dbg !81
  %13 = bitcast i32* %12 to i8*, !dbg !81
  call void @free(i8* %13) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFalse, align 4, !dbg !112
  %tobool = icmp ne i32 %0, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end2, !dbg !117

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !118
  %1 = bitcast i8* %call to i32*, !dbg !120
  store i32* %1, i32** %data, align 8, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %2, null, !dbg !124
  br i1 %cmp, label %if.then1, label %if.end, !dbg !125

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !136
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx4, align 4, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !142
  %cmp5 = icmp ult i64 %4, 100, !dbg !144
  br i1 %cmp5, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !148
  %6 = load i32, i32* %arrayidx6, align 4, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %8 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !149
  store i32 %6, i32* %arrayidx7, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !157
  store i32 0, i32* %arrayidx8, align 4, !dbg !158
  %11 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* %11), !dbg !160
  %12 = load i32*, i32** %data, align 8, !dbg !161
  %13 = bitcast i32* %12 to i8*, !dbg !161
  call void @free(i8* %13) #5, !dbg !162
  ret void, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !164 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !165, metadata !DIExpression()), !dbg !166
  store i32* null, i32** %data, align 8, !dbg !167
  %0 = load i32, i32* @staticTrue, align 4, !dbg !168
  %tobool = icmp ne i32 %0, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end2, !dbg !170

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !171
  %1 = bitcast i8* %call to i32*, !dbg !173
  store i32* %1, i32** %data, align 8, !dbg !174
  %2 = load i32*, i32** %data, align 8, !dbg !175
  %cmp = icmp eq i32* %2, null, !dbg !177
  br i1 %cmp, label %if.then1, label %if.end, !dbg !178

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !179
  unreachable, !dbg !179

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !181
  store i32 0, i32* %arrayidx, align 4, !dbg !182
  br label %if.end2, !dbg !183

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !184, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !187, metadata !DIExpression()), !dbg !188
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !189
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !190
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !191
  store i32 0, i32* %arrayidx4, align 4, !dbg !192
  store i64 0, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !196
  %cmp5 = icmp ult i64 %4, 100, !dbg !198
  br i1 %cmp5, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !202
  %6 = load i32, i32* %arrayidx6, align 4, !dbg !202
  %7 = load i32*, i32** %data, align 8, !dbg !203
  %8 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !203
  store i32 %6, i32* %arrayidx7, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %9, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !211
  %arrayidx8 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !211
  store i32 0, i32* %arrayidx8, align 4, !dbg !212
  %11 = load i32*, i32** %data, align 8, !dbg !213
  call void @printWLine(i32* %11), !dbg !214
  %12 = load i32*, i32** %data, align 8, !dbg !215
  %13 = bitcast i32* %12 to i8*, !dbg !215
  call void @free(i8* %13) #5, !dbg !216
  ret void, !dbg !217
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocation(line: 37, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !32)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 27)
!41 = !DILocation(line: 39, column: 9, scope: !32)
!42 = !DILocation(line: 39, column: 17, scope: !32)
!43 = !DILocation(line: 40, column: 5, scope: !32)
!44 = !DILocalVariable(name: "i", scope: !45, file: !15, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !45, file: !15, line: 43, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 43, column: 17, scope: !45)
!54 = !DILocation(line: 44, column: 17, scope: !45)
!55 = !DILocation(line: 44, column: 9, scope: !45)
!56 = !DILocation(line: 45, column: 9, scope: !45)
!57 = !DILocation(line: 45, column: 23, scope: !45)
!58 = !DILocation(line: 47, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !45, file: !15, line: 47, column: 9)
!60 = !DILocation(line: 47, column: 14, scope: !59)
!61 = !DILocation(line: 47, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 47, column: 9)
!63 = !DILocation(line: 47, column: 23, scope: !62)
!64 = !DILocation(line: 47, column: 9, scope: !59)
!65 = !DILocation(line: 49, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 48, column: 9)
!67 = !DILocation(line: 49, column: 23, scope: !66)
!68 = !DILocation(line: 49, column: 13, scope: !66)
!69 = !DILocation(line: 49, column: 18, scope: !66)
!70 = !DILocation(line: 49, column: 21, scope: !66)
!71 = !DILocation(line: 50, column: 9, scope: !66)
!72 = !DILocation(line: 47, column: 31, scope: !62)
!73 = !DILocation(line: 47, column: 9, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 50, column: 9, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 51, column: 9, scope: !45)
!78 = !DILocation(line: 51, column: 21, scope: !45)
!79 = !DILocation(line: 52, column: 20, scope: !45)
!80 = !DILocation(line: 52, column: 9, scope: !45)
!81 = !DILocation(line: 53, column: 14, scope: !45)
!82 = !DILocation(line: 53, column: 9, scope: !45)
!83 = !DILocation(line: 55, column: 1, scope: !22)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_05_good", scope: !15, file: !15, line: 122, type: !23, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 124, column: 5, scope: !84)
!86 = !DILocation(line: 125, column: 5, scope: !84)
!87 = !DILocation(line: 126, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 138, type: !89, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DISubroutineType(types: !90)
!90 = !{!9, !9, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 138, type: !9)
!95 = !DILocation(line: 138, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 138, type: !91)
!97 = !DILocation(line: 138, column: 27, scope: !88)
!98 = !DILocation(line: 141, column: 22, scope: !88)
!99 = !DILocation(line: 141, column: 12, scope: !88)
!100 = !DILocation(line: 141, column: 5, scope: !88)
!101 = !DILocation(line: 143, column: 5, scope: !88)
!102 = !DILocation(line: 144, column: 5, scope: !88)
!103 = !DILocation(line: 145, column: 5, scope: !88)
!104 = !DILocation(line: 148, column: 5, scope: !88)
!105 = !DILocation(line: 149, column: 5, scope: !88)
!106 = !DILocation(line: 150, column: 5, scope: !88)
!107 = !DILocation(line: 152, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !23, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 64, type: !6)
!110 = !DILocation(line: 64, column: 15, scope: !108)
!111 = !DILocation(line: 65, column: 10, scope: !108)
!112 = !DILocation(line: 66, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !15, line: 66, column: 8)
!114 = !DILocation(line: 66, column: 8, scope: !108)
!115 = !DILocation(line: 69, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !15, line: 67, column: 5)
!117 = !DILocation(line: 70, column: 5, scope: !116)
!118 = !DILocation(line: 74, column: 27, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !15, line: 72, column: 5)
!120 = !DILocation(line: 74, column: 16, scope: !119)
!121 = !DILocation(line: 74, column: 14, scope: !119)
!122 = !DILocation(line: 75, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 75, column: 13)
!124 = !DILocation(line: 75, column: 18, scope: !123)
!125 = !DILocation(line: 75, column: 13, scope: !119)
!126 = !DILocation(line: 75, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 75, column: 27)
!128 = !DILocation(line: 76, column: 9, scope: !119)
!129 = !DILocation(line: 76, column: 17, scope: !119)
!130 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 79, type: !46)
!131 = distinct !DILexicalBlock(scope: !108, file: !15, line: 78, column: 5)
!132 = !DILocation(line: 79, column: 16, scope: !131)
!133 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 80, type: !50)
!134 = !DILocation(line: 80, column: 17, scope: !131)
!135 = !DILocation(line: 81, column: 17, scope: !131)
!136 = !DILocation(line: 81, column: 9, scope: !131)
!137 = !DILocation(line: 82, column: 9, scope: !131)
!138 = !DILocation(line: 82, column: 23, scope: !131)
!139 = !DILocation(line: 84, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !131, file: !15, line: 84, column: 9)
!141 = !DILocation(line: 84, column: 14, scope: !140)
!142 = !DILocation(line: 84, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 84, column: 9)
!144 = !DILocation(line: 84, column: 23, scope: !143)
!145 = !DILocation(line: 84, column: 9, scope: !140)
!146 = !DILocation(line: 86, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 85, column: 9)
!148 = !DILocation(line: 86, column: 23, scope: !147)
!149 = !DILocation(line: 86, column: 13, scope: !147)
!150 = !DILocation(line: 86, column: 18, scope: !147)
!151 = !DILocation(line: 86, column: 21, scope: !147)
!152 = !DILocation(line: 87, column: 9, scope: !147)
!153 = !DILocation(line: 84, column: 31, scope: !143)
!154 = !DILocation(line: 84, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !76}
!156 = !DILocation(line: 87, column: 9, scope: !140)
!157 = !DILocation(line: 88, column: 9, scope: !131)
!158 = !DILocation(line: 88, column: 21, scope: !131)
!159 = !DILocation(line: 89, column: 20, scope: !131)
!160 = !DILocation(line: 89, column: 9, scope: !131)
!161 = !DILocation(line: 90, column: 14, scope: !131)
!162 = !DILocation(line: 90, column: 9, scope: !131)
!163 = !DILocation(line: 92, column: 1, scope: !108)
!164 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 95, type: !23, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!165 = !DILocalVariable(name: "data", scope: !164, file: !15, line: 97, type: !6)
!166 = !DILocation(line: 97, column: 15, scope: !164)
!167 = !DILocation(line: 98, column: 10, scope: !164)
!168 = !DILocation(line: 99, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !15, line: 99, column: 8)
!170 = !DILocation(line: 99, column: 8, scope: !164)
!171 = !DILocation(line: 102, column: 27, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 100, column: 5)
!173 = !DILocation(line: 102, column: 16, scope: !172)
!174 = !DILocation(line: 102, column: 14, scope: !172)
!175 = !DILocation(line: 103, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 103, column: 13)
!177 = !DILocation(line: 103, column: 18, scope: !176)
!178 = !DILocation(line: 103, column: 13, scope: !172)
!179 = !DILocation(line: 103, column: 28, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 103, column: 27)
!181 = !DILocation(line: 104, column: 9, scope: !172)
!182 = !DILocation(line: 104, column: 17, scope: !172)
!183 = !DILocation(line: 105, column: 5, scope: !172)
!184 = !DILocalVariable(name: "i", scope: !185, file: !15, line: 107, type: !46)
!185 = distinct !DILexicalBlock(scope: !164, file: !15, line: 106, column: 5)
!186 = !DILocation(line: 107, column: 16, scope: !185)
!187 = !DILocalVariable(name: "source", scope: !185, file: !15, line: 108, type: !50)
!188 = !DILocation(line: 108, column: 17, scope: !185)
!189 = !DILocation(line: 109, column: 17, scope: !185)
!190 = !DILocation(line: 109, column: 9, scope: !185)
!191 = !DILocation(line: 110, column: 9, scope: !185)
!192 = !DILocation(line: 110, column: 23, scope: !185)
!193 = !DILocation(line: 112, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !185, file: !15, line: 112, column: 9)
!195 = !DILocation(line: 112, column: 14, scope: !194)
!196 = !DILocation(line: 112, column: 21, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !15, line: 112, column: 9)
!198 = !DILocation(line: 112, column: 23, scope: !197)
!199 = !DILocation(line: 112, column: 9, scope: !194)
!200 = !DILocation(line: 114, column: 30, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !15, line: 113, column: 9)
!202 = !DILocation(line: 114, column: 23, scope: !201)
!203 = !DILocation(line: 114, column: 13, scope: !201)
!204 = !DILocation(line: 114, column: 18, scope: !201)
!205 = !DILocation(line: 114, column: 21, scope: !201)
!206 = !DILocation(line: 115, column: 9, scope: !201)
!207 = !DILocation(line: 112, column: 31, scope: !197)
!208 = !DILocation(line: 112, column: 9, scope: !197)
!209 = distinct !{!209, !199, !210, !76}
!210 = !DILocation(line: 115, column: 9, scope: !194)
!211 = !DILocation(line: 116, column: 9, scope: !185)
!212 = !DILocation(line: 116, column: 21, scope: !185)
!213 = !DILocation(line: 117, column: 20, scope: !185)
!214 = !DILocation(line: 117, column: 9, scope: !185)
!215 = !DILocation(line: 118, column: 14, scope: !185)
!216 = !DILocation(line: 118, column: 9, scope: !185)
!217 = !DILocation(line: 120, column: 1, scope: !164)
