; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticTrue, align 4, !dbg !26
  %tobool = icmp ne i32 %0, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end2, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !29
  %1 = bitcast i8* %call to i32*, !dbg !31
  store i32* %1, i32** %data, align 8, !dbg !32
  %2 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !39

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !55
  %cmp3 = icmp ult i64 %4, 100, !dbg !57
  br i1 %cmp3, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !61
  %6 = load i32, i32* %arrayidx, align 4, !dbg !61
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !62
  store i32 %6, i32* %arrayidx4, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %9, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !71
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !71
  call void @printIntLine(i32 %11), !dbg !72
  %12 = load i32*, i32** %data, align 8, !dbg !73
  %13 = bitcast i32* %12 to i8*, !dbg !73
  call void @free(i8* %13) #6, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_good() #0 !dbg !76 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  %0 = load i32, i32* @staticFalse, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end2, !dbg !109

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !110
  %1 = bitcast i8* %call to i32*, !dbg !112
  store i32* %1, i32** %data, align 8, !dbg !113
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %2, null, !dbg !116
  br i1 %cmp, label %if.then1, label %if.end, !dbg !117

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp3 = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp3, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i32, i32* %arrayidx, align 4, !dbg !135
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !136
  store i32 %6, i32* %arrayidx4, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !144
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !144
  call void @printIntLine(i32 %11), !dbg !145
  %12 = load i32*, i32** %data, align 8, !dbg !146
  %13 = bitcast i32* %12 to i8*, !dbg !146
  call void @free(i8* %13) #6, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32* null, i32** %data, align 8, !dbg !152
  %0 = load i32, i32* @staticTrue, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end2, !dbg !155

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !156
  %1 = bitcast i8* %call to i32*, !dbg !158
  store i32* %1, i32** %data, align 8, !dbg !159
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %cmp = icmp eq i32* %2, null, !dbg !162
  br i1 %cmp, label %if.then1, label %if.end, !dbg !163

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !166

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !176
  %cmp3 = icmp ult i64 %4, 100, !dbg !178
  br i1 %cmp3, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !182
  %6 = load i32, i32* %arrayidx, align 4, !dbg !182
  %7 = load i32*, i32** %data, align 8, !dbg !183
  %8 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !183
  store i32 %6, i32* %arrayidx4, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %9, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !191
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !191
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !191
  call void @printIntLine(i32 %11), !dbg !192
  %12 = load i32*, i32** %data, align 8, !dbg !193
  %13 = bitcast i32* %12 to i8*, !dbg !193
  call void @free(i8* %13) #6, !dbg !194
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !7, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_bad", scope: !13, file: !13, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 30, type: !6)
!24 = !DILocation(line: 30, column: 11, scope: !20)
!25 = !DILocation(line: 31, column: 10, scope: !20)
!26 = !DILocation(line: 32, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 32, column: 8)
!28 = !DILocation(line: 32, column: 8, scope: !20)
!29 = !DILocation(line: 35, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !13, line: 33, column: 5)
!31 = !DILocation(line: 35, column: 16, scope: !30)
!32 = !DILocation(line: 35, column: 14, scope: !30)
!33 = !DILocation(line: 36, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 36, column: 13)
!35 = !DILocation(line: 36, column: 18, scope: !34)
!36 = !DILocation(line: 36, column: 13, scope: !30)
!37 = !DILocation(line: 36, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 36, column: 27)
!39 = !DILocation(line: 37, column: 5, scope: !30)
!40 = !DILocalVariable(name: "source", scope: !41, file: !13, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !13, line: 38, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 39, column: 13, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !13, line: 41, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !13, line: 40, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 41, column: 20, scope: !47)
!52 = !DILocation(line: 43, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !13, line: 43, column: 13)
!54 = !DILocation(line: 43, column: 18, scope: !53)
!55 = !DILocation(line: 43, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !13, line: 43, column: 13)
!57 = !DILocation(line: 43, column: 27, scope: !56)
!58 = !DILocation(line: 43, column: 13, scope: !53)
!59 = !DILocation(line: 45, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !13, line: 44, column: 13)
!61 = !DILocation(line: 45, column: 27, scope: !60)
!62 = !DILocation(line: 45, column: 17, scope: !60)
!63 = !DILocation(line: 45, column: 22, scope: !60)
!64 = !DILocation(line: 45, column: 25, scope: !60)
!65 = !DILocation(line: 46, column: 13, scope: !60)
!66 = !DILocation(line: 43, column: 35, scope: !56)
!67 = !DILocation(line: 43, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 46, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 47, column: 26, scope: !47)
!72 = !DILocation(line: 47, column: 13, scope: !47)
!73 = !DILocation(line: 48, column: 18, scope: !47)
!74 = !DILocation(line: 48, column: 13, scope: !47)
!75 = !DILocation(line: 51, column: 1, scope: !20)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_05_good", scope: !13, file: !13, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 116, column: 5, scope: !76)
!78 = !DILocation(line: 117, column: 5, scope: !76)
!79 = !DILocation(line: 118, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 130, type: !81, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !13, line: 130, type: !7)
!87 = !DILocation(line: 130, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !13, line: 130, type: !83)
!89 = !DILocation(line: 130, column: 27, scope: !80)
!90 = !DILocation(line: 133, column: 22, scope: !80)
!91 = !DILocation(line: 133, column: 12, scope: !80)
!92 = !DILocation(line: 133, column: 5, scope: !80)
!93 = !DILocation(line: 135, column: 5, scope: !80)
!94 = !DILocation(line: 136, column: 5, scope: !80)
!95 = !DILocation(line: 137, column: 5, scope: !80)
!96 = !DILocation(line: 140, column: 5, scope: !80)
!97 = !DILocation(line: 141, column: 5, scope: !80)
!98 = !DILocation(line: 142, column: 5, scope: !80)
!99 = !DILocation(line: 144, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !13, line: 60, type: !6)
!102 = !DILocation(line: 60, column: 11, scope: !100)
!103 = !DILocation(line: 61, column: 10, scope: !100)
!104 = !DILocation(line: 62, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !13, line: 62, column: 8)
!106 = !DILocation(line: 62, column: 8, scope: !100)
!107 = !DILocation(line: 65, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !13, line: 63, column: 5)
!109 = !DILocation(line: 66, column: 5, scope: !108)
!110 = !DILocation(line: 70, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !13, line: 68, column: 5)
!112 = !DILocation(line: 70, column: 16, scope: !111)
!113 = !DILocation(line: 70, column: 14, scope: !111)
!114 = !DILocation(line: 71, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 71, column: 13)
!116 = !DILocation(line: 71, column: 18, scope: !115)
!117 = !DILocation(line: 71, column: 13, scope: !111)
!118 = !DILocation(line: 71, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !13, line: 71, column: 27)
!120 = !DILocalVariable(name: "source", scope: !121, file: !13, line: 74, type: !42)
!121 = distinct !DILexicalBlock(scope: !100, file: !13, line: 73, column: 5)
!122 = !DILocation(line: 74, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !13, line: 76, type: !48)
!124 = distinct !DILexicalBlock(scope: !121, file: !13, line: 75, column: 9)
!125 = !DILocation(line: 76, column: 20, scope: !124)
!126 = !DILocation(line: 78, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 18, scope: !127)
!129 = !DILocation(line: 78, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !13, line: 78, column: 13)
!131 = !DILocation(line: 78, column: 27, scope: !130)
!132 = !DILocation(line: 78, column: 13, scope: !127)
!133 = !DILocation(line: 80, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 79, column: 13)
!135 = !DILocation(line: 80, column: 27, scope: !134)
!136 = !DILocation(line: 80, column: 17, scope: !134)
!137 = !DILocation(line: 80, column: 22, scope: !134)
!138 = !DILocation(line: 80, column: 25, scope: !134)
!139 = !DILocation(line: 81, column: 13, scope: !134)
!140 = !DILocation(line: 78, column: 35, scope: !130)
!141 = !DILocation(line: 78, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !70}
!143 = !DILocation(line: 81, column: 13, scope: !127)
!144 = !DILocation(line: 82, column: 26, scope: !124)
!145 = !DILocation(line: 82, column: 13, scope: !124)
!146 = !DILocation(line: 83, column: 18, scope: !124)
!147 = !DILocation(line: 83, column: 13, scope: !124)
!148 = !DILocation(line: 86, column: 1, scope: !100)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !13, line: 91, type: !6)
!151 = !DILocation(line: 91, column: 11, scope: !149)
!152 = !DILocation(line: 92, column: 10, scope: !149)
!153 = !DILocation(line: 93, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !13, line: 93, column: 8)
!155 = !DILocation(line: 93, column: 8, scope: !149)
!156 = !DILocation(line: 96, column: 23, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !13, line: 94, column: 5)
!158 = !DILocation(line: 96, column: 16, scope: !157)
!159 = !DILocation(line: 96, column: 14, scope: !157)
!160 = !DILocation(line: 97, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !13, line: 97, column: 13)
!162 = !DILocation(line: 97, column: 18, scope: !161)
!163 = !DILocation(line: 97, column: 13, scope: !157)
!164 = !DILocation(line: 97, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !13, line: 97, column: 27)
!166 = !DILocation(line: 98, column: 5, scope: !157)
!167 = !DILocalVariable(name: "source", scope: !168, file: !13, line: 100, type: !42)
!168 = distinct !DILexicalBlock(scope: !149, file: !13, line: 99, column: 5)
!169 = !DILocation(line: 100, column: 13, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !171, file: !13, line: 102, type: !48)
!171 = distinct !DILexicalBlock(scope: !168, file: !13, line: 101, column: 9)
!172 = !DILocation(line: 102, column: 20, scope: !171)
!173 = !DILocation(line: 104, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !13, line: 104, column: 13)
!175 = !DILocation(line: 104, column: 18, scope: !174)
!176 = !DILocation(line: 104, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !13, line: 104, column: 13)
!178 = !DILocation(line: 104, column: 27, scope: !177)
!179 = !DILocation(line: 104, column: 13, scope: !174)
!180 = !DILocation(line: 106, column: 34, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !13, line: 105, column: 13)
!182 = !DILocation(line: 106, column: 27, scope: !181)
!183 = !DILocation(line: 106, column: 17, scope: !181)
!184 = !DILocation(line: 106, column: 22, scope: !181)
!185 = !DILocation(line: 106, column: 25, scope: !181)
!186 = !DILocation(line: 107, column: 13, scope: !181)
!187 = !DILocation(line: 104, column: 35, scope: !177)
!188 = !DILocation(line: 104, column: 13, scope: !177)
!189 = distinct !{!189, !179, !190, !70}
!190 = !DILocation(line: 107, column: 13, scope: !174)
!191 = !DILocation(line: 108, column: 26, scope: !171)
!192 = !DILocation(line: 108, column: 13, scope: !171)
!193 = !DILocation(line: 109, column: 18, scope: !171)
!194 = !DILocation(line: 109, column: 13, scope: !171)
!195 = !DILocation(line: 112, column: 1, scope: !149)
