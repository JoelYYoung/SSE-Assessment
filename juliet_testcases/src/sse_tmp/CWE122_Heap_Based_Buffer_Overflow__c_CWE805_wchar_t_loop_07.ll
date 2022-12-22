; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end3, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %cmp1 = icmp eq i32* %2, null, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !60
  %cmp6 = icmp ult i64 %4, 100, !dbg !62
  br i1 %cmp6, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !66
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !66
  %7 = load i32*, i32** %data, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !67
  store i32 %6, i32* %arrayidx8, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %9, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !76
  store i32 0, i32* %arrayidx9, align 4, !dbg !77
  %11 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %11), !dbg !79
  %12 = load i32*, i32** %data, align 8, !dbg !80
  %13 = bitcast i32* %12 to i8*, !dbg !80
  call void @free(i8* %13) #5, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %0 = load i32, i32* @staticFive, align 4, !dbg !111
  %cmp = icmp ne i32 %0, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end3, !dbg !117

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !118
  %1 = bitcast i8* %call to i32*, !dbg !120
  store i32* %1, i32** %data, align 8, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %cmp1 = icmp eq i32* %2, null, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !136
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx5, align 4, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !142
  %cmp6 = icmp ult i64 %4, 100, !dbg !144
  br i1 %cmp6, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !148
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %8 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !149
  store i32 %6, i32* %arrayidx8, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !157
  store i32 0, i32* %arrayidx9, align 4, !dbg !158
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !168
  %cmp = icmp eq i32 %0, 5, !dbg !170
  br i1 %cmp, label %if.then, label %if.end3, !dbg !171

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !172
  %1 = bitcast i8* %call to i32*, !dbg !174
  store i32* %1, i32** %data, align 8, !dbg !175
  %2 = load i32*, i32** %data, align 8, !dbg !176
  %cmp1 = icmp eq i32* %2, null, !dbg !178
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !179

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !183
  br label %if.end3, !dbg !184

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !188, metadata !DIExpression()), !dbg !189
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !190
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !191
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !192
  store i32 0, i32* %arrayidx5, align 4, !dbg !193
  store i64 0, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !197
  %cmp6 = icmp ult i64 %4, 100, !dbg !199
  br i1 %cmp6, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !203
  %6 = load i32, i32* %arrayidx7, align 4, !dbg !203
  %7 = load i32*, i32** %data, align 8, !dbg !204
  %8 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !204
  store i32 %6, i32* %arrayidx8, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %9, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !212
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !212
  store i32 0, i32* %arrayidx9, align 4, !dbg !213
  %11 = load i32*, i32** %data, align 8, !dbg !214
  call void @printWLine(i32* %11), !dbg !215
  %12 = load i32*, i32** %data, align 8, !dbg !216
  %13 = bitcast i32* %12 to i8*, !dbg !216
  call void @free(i8* %13) #5, !dbg !217
  ret void, !dbg !218
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 10, scope: !20)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !20)
!30 = !DILocation(line: 36, column: 27, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 14, scope: !31)
!34 = !DILocation(line: 37, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 37, column: 13)
!36 = !DILocation(line: 37, column: 18, scope: !35)
!37 = !DILocation(line: 37, column: 13, scope: !31)
!38 = !DILocation(line: 37, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 37, column: 27)
!40 = !DILocation(line: 38, column: 9, scope: !31)
!41 = !DILocation(line: 38, column: 17, scope: !31)
!42 = !DILocation(line: 39, column: 5, scope: !31)
!43 = !DILocalVariable(name: "i", scope: !44, file: !13, line: 41, type: !45)
!44 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 41, column: 16, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 42, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 42, column: 17, scope: !44)
!53 = !DILocation(line: 43, column: 17, scope: !44)
!54 = !DILocation(line: 43, column: 9, scope: !44)
!55 = !DILocation(line: 44, column: 9, scope: !44)
!56 = !DILocation(line: 44, column: 23, scope: !44)
!57 = !DILocation(line: 46, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !13, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 14, scope: !58)
!60 = !DILocation(line: 46, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !13, line: 46, column: 9)
!62 = !DILocation(line: 46, column: 23, scope: !61)
!63 = !DILocation(line: 46, column: 9, scope: !58)
!64 = !DILocation(line: 48, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 47, column: 9)
!66 = !DILocation(line: 48, column: 23, scope: !65)
!67 = !DILocation(line: 48, column: 13, scope: !65)
!68 = !DILocation(line: 48, column: 18, scope: !65)
!69 = !DILocation(line: 48, column: 21, scope: !65)
!70 = !DILocation(line: 49, column: 9, scope: !65)
!71 = !DILocation(line: 46, column: 31, scope: !61)
!72 = !DILocation(line: 46, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 49, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 50, column: 9, scope: !44)
!77 = !DILocation(line: 50, column: 21, scope: !44)
!78 = !DILocation(line: 51, column: 20, scope: !44)
!79 = !DILocation(line: 51, column: 9, scope: !44)
!80 = !DILocation(line: 52, column: 14, scope: !44)
!81 = !DILocation(line: 52, column: 9, scope: !44)
!82 = !DILocation(line: 54, column: 1, scope: !20)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_07_good", scope: !13, file: !13, line: 121, type: !21, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 123, column: 5, scope: !83)
!85 = !DILocation(line: 124, column: 5, scope: !83)
!86 = !DILocation(line: 125, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 137, type: !88, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{!9, !9, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !13, line: 137, type: !9)
!94 = !DILocation(line: 137, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !13, line: 137, type: !90)
!96 = !DILocation(line: 137, column: 27, scope: !87)
!97 = !DILocation(line: 140, column: 22, scope: !87)
!98 = !DILocation(line: 140, column: 12, scope: !87)
!99 = !DILocation(line: 140, column: 5, scope: !87)
!100 = !DILocation(line: 142, column: 5, scope: !87)
!101 = !DILocation(line: 143, column: 5, scope: !87)
!102 = !DILocation(line: 144, column: 5, scope: !87)
!103 = !DILocation(line: 147, column: 5, scope: !87)
!104 = !DILocation(line: 148, column: 5, scope: !87)
!105 = !DILocation(line: 149, column: 5, scope: !87)
!106 = !DILocation(line: 151, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !13, line: 63, type: !6)
!109 = !DILocation(line: 63, column: 15, scope: !107)
!110 = !DILocation(line: 64, column: 10, scope: !107)
!111 = !DILocation(line: 65, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !13, line: 65, column: 8)
!113 = !DILocation(line: 65, column: 18, scope: !112)
!114 = !DILocation(line: 65, column: 8, scope: !107)
!115 = !DILocation(line: 68, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !13, line: 66, column: 5)
!117 = !DILocation(line: 69, column: 5, scope: !116)
!118 = !DILocation(line: 73, column: 27, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !13, line: 71, column: 5)
!120 = !DILocation(line: 73, column: 16, scope: !119)
!121 = !DILocation(line: 73, column: 14, scope: !119)
!122 = !DILocation(line: 74, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !13, line: 74, column: 13)
!124 = !DILocation(line: 74, column: 18, scope: !123)
!125 = !DILocation(line: 74, column: 13, scope: !119)
!126 = !DILocation(line: 74, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 74, column: 27)
!128 = !DILocation(line: 75, column: 9, scope: !119)
!129 = !DILocation(line: 75, column: 17, scope: !119)
!130 = !DILocalVariable(name: "i", scope: !131, file: !13, line: 78, type: !45)
!131 = distinct !DILexicalBlock(scope: !107, file: !13, line: 77, column: 5)
!132 = !DILocation(line: 78, column: 16, scope: !131)
!133 = !DILocalVariable(name: "source", scope: !131, file: !13, line: 79, type: !49)
!134 = !DILocation(line: 79, column: 17, scope: !131)
!135 = !DILocation(line: 80, column: 17, scope: !131)
!136 = !DILocation(line: 80, column: 9, scope: !131)
!137 = !DILocation(line: 81, column: 9, scope: !131)
!138 = !DILocation(line: 81, column: 23, scope: !131)
!139 = !DILocation(line: 83, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !131, file: !13, line: 83, column: 9)
!141 = !DILocation(line: 83, column: 14, scope: !140)
!142 = !DILocation(line: 83, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !13, line: 83, column: 9)
!144 = !DILocation(line: 83, column: 23, scope: !143)
!145 = !DILocation(line: 83, column: 9, scope: !140)
!146 = !DILocation(line: 85, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !13, line: 84, column: 9)
!148 = !DILocation(line: 85, column: 23, scope: !147)
!149 = !DILocation(line: 85, column: 13, scope: !147)
!150 = !DILocation(line: 85, column: 18, scope: !147)
!151 = !DILocation(line: 85, column: 21, scope: !147)
!152 = !DILocation(line: 86, column: 9, scope: !147)
!153 = !DILocation(line: 83, column: 31, scope: !143)
!154 = !DILocation(line: 83, column: 9, scope: !143)
!155 = distinct !{!155, !145, !156, !75}
!156 = !DILocation(line: 86, column: 9, scope: !140)
!157 = !DILocation(line: 87, column: 9, scope: !131)
!158 = !DILocation(line: 87, column: 21, scope: !131)
!159 = !DILocation(line: 88, column: 20, scope: !131)
!160 = !DILocation(line: 88, column: 9, scope: !131)
!161 = !DILocation(line: 89, column: 14, scope: !131)
!162 = !DILocation(line: 89, column: 9, scope: !131)
!163 = !DILocation(line: 91, column: 1, scope: !107)
!164 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!165 = !DILocalVariable(name: "data", scope: !164, file: !13, line: 96, type: !6)
!166 = !DILocation(line: 96, column: 15, scope: !164)
!167 = !DILocation(line: 97, column: 10, scope: !164)
!168 = !DILocation(line: 98, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !13, line: 98, column: 8)
!170 = !DILocation(line: 98, column: 18, scope: !169)
!171 = !DILocation(line: 98, column: 8, scope: !164)
!172 = !DILocation(line: 101, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !13, line: 99, column: 5)
!174 = !DILocation(line: 101, column: 16, scope: !173)
!175 = !DILocation(line: 101, column: 14, scope: !173)
!176 = !DILocation(line: 102, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !13, line: 102, column: 13)
!178 = !DILocation(line: 102, column: 18, scope: !177)
!179 = !DILocation(line: 102, column: 13, scope: !173)
!180 = !DILocation(line: 102, column: 28, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !13, line: 102, column: 27)
!182 = !DILocation(line: 103, column: 9, scope: !173)
!183 = !DILocation(line: 103, column: 17, scope: !173)
!184 = !DILocation(line: 104, column: 5, scope: !173)
!185 = !DILocalVariable(name: "i", scope: !186, file: !13, line: 106, type: !45)
!186 = distinct !DILexicalBlock(scope: !164, file: !13, line: 105, column: 5)
!187 = !DILocation(line: 106, column: 16, scope: !186)
!188 = !DILocalVariable(name: "source", scope: !186, file: !13, line: 107, type: !49)
!189 = !DILocation(line: 107, column: 17, scope: !186)
!190 = !DILocation(line: 108, column: 17, scope: !186)
!191 = !DILocation(line: 108, column: 9, scope: !186)
!192 = !DILocation(line: 109, column: 9, scope: !186)
!193 = !DILocation(line: 109, column: 23, scope: !186)
!194 = !DILocation(line: 111, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !186, file: !13, line: 111, column: 9)
!196 = !DILocation(line: 111, column: 14, scope: !195)
!197 = !DILocation(line: 111, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !13, line: 111, column: 9)
!199 = !DILocation(line: 111, column: 23, scope: !198)
!200 = !DILocation(line: 111, column: 9, scope: !195)
!201 = !DILocation(line: 113, column: 30, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !13, line: 112, column: 9)
!203 = !DILocation(line: 113, column: 23, scope: !202)
!204 = !DILocation(line: 113, column: 13, scope: !202)
!205 = !DILocation(line: 113, column: 18, scope: !202)
!206 = !DILocation(line: 113, column: 21, scope: !202)
!207 = !DILocation(line: 114, column: 9, scope: !202)
!208 = !DILocation(line: 111, column: 31, scope: !198)
!209 = !DILocation(line: 111, column: 9, scope: !198)
!210 = distinct !{!210, !200, !211, !75}
!211 = !DILocation(line: 114, column: 9, scope: !195)
!212 = !DILocation(line: 115, column: 9, scope: !186)
!213 = !DILocation(line: 115, column: 21, scope: !186)
!214 = !DILocation(line: 116, column: 20, scope: !186)
!215 = !DILocation(line: 116, column: 9, scope: !186)
!216 = !DILocation(line: 117, column: 14, scope: !186)
!217 = !DILocation(line: 117, column: 9, scope: !186)
!218 = !DILocation(line: 119, column: 1, scope: !164)
