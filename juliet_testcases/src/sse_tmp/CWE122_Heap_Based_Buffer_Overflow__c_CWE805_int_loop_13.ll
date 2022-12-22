; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !25
  %1 = bitcast i8* %call to i32*, !dbg !27
  store i32* %1, i32** %data, align 8, !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  %cmp1 = icmp eq i32* %2, null, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !51
  %cmp4 = icmp ult i64 %4, 100, !dbg !53
  br i1 %cmp4, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !57
  %6 = load i32, i32* %arrayidx, align 4, !dbg !57
  %7 = load i32*, i32** %data, align 8, !dbg !58
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !58
  store i32 %6, i32* %arrayidx5, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %9, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !67
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !67
  call void @printIntLine(i32 %11), !dbg !68
  %12 = load i32*, i32** %data, align 8, !dbg !69
  %13 = bitcast i32* %12 to i8*, !dbg !69
  call void @free(i8* %13) #6, !dbg !70
  ret void, !dbg !71
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !100
  %cmp = icmp ne i32 %0, 5, !dbg !102
  br i1 %cmp, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  br label %if.end3, !dbg !106

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !107
  %1 = bitcast i8* %call to i32*, !dbg !109
  store i32* %1, i32** %data, align 8, !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %cmp1 = icmp eq i32* %2, null, !dbg !113
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !114

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !126
  %cmp4 = icmp ult i64 %4, 100, !dbg !128
  br i1 %cmp4, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !132
  %6 = load i32, i32* %arrayidx, align 4, !dbg !132
  %7 = load i32*, i32** %data, align 8, !dbg !133
  %8 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !133
  store i32 %6, i32* %arrayidx5, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %9, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !141
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !141
  call void @printIntLine(i32 %11), !dbg !142
  %12 = load i32*, i32** %data, align 8, !dbg !143
  %13 = bitcast i32* %12 to i8*, !dbg !143
  call void @free(i8* %13) #6, !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !147, metadata !DIExpression()), !dbg !148
  store i32* null, i32** %data, align 8, !dbg !149
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !150
  %cmp = icmp eq i32 %0, 5, !dbg !152
  br i1 %cmp, label %if.then, label %if.end3, !dbg !153

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !154
  %1 = bitcast i8* %call to i32*, !dbg !156
  store i32* %1, i32** %data, align 8, !dbg !157
  %2 = load i32*, i32** %data, align 8, !dbg !158
  %cmp1 = icmp eq i32* %2, null, !dbg !160
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !161

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !164

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !174
  %cmp4 = icmp ult i64 %4, 100, !dbg !176
  br i1 %cmp4, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !180
  %6 = load i32, i32* %arrayidx, align 4, !dbg !180
  %7 = load i32*, i32** %data, align 8, !dbg !181
  %8 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !181
  store i32 %6, i32* %arrayidx5, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %9, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !189
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !189
  call void @printIntLine(i32 %11), !dbg !190
  %12 = load i32*, i32** %data, align 8, !dbg !191
  %13 = bitcast i32* %12 to i8*, !dbg !191
  call void @free(i8* %13) #6, !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 25, scope: !22)
!24 = !DILocation(line: 25, column: 8, scope: !14)
!25 = !DILocation(line: 28, column: 23, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!27 = !DILocation(line: 28, column: 16, scope: !26)
!28 = !DILocation(line: 28, column: 14, scope: !26)
!29 = !DILocation(line: 29, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 13)
!31 = !DILocation(line: 29, column: 18, scope: !30)
!32 = !DILocation(line: 29, column: 13, scope: !26)
!33 = !DILocation(line: 29, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 27)
!35 = !DILocation(line: 30, column: 5, scope: !26)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 32, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 32, column: 13, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !15, line: 34, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !15, line: 33, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 34, column: 20, scope: !43)
!48 = !DILocation(line: 36, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !15, line: 36, column: 13)
!50 = !DILocation(line: 36, column: 18, scope: !49)
!51 = !DILocation(line: 36, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 36, column: 13)
!53 = !DILocation(line: 36, column: 27, scope: !52)
!54 = !DILocation(line: 36, column: 13, scope: !49)
!55 = !DILocation(line: 38, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 37, column: 13)
!57 = !DILocation(line: 38, column: 27, scope: !56)
!58 = !DILocation(line: 38, column: 17, scope: !56)
!59 = !DILocation(line: 38, column: 22, scope: !56)
!60 = !DILocation(line: 38, column: 25, scope: !56)
!61 = !DILocation(line: 39, column: 13, scope: !56)
!62 = !DILocation(line: 36, column: 35, scope: !52)
!63 = !DILocation(line: 36, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 39, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 40, column: 26, scope: !43)
!68 = !DILocation(line: 40, column: 13, scope: !43)
!69 = !DILocation(line: 41, column: 18, scope: !43)
!70 = !DILocation(line: 41, column: 13, scope: !43)
!71 = !DILocation(line: 44, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_13_good", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 109, column: 5, scope: !72)
!74 = !DILocation(line: 110, column: 5, scope: !72)
!75 = !DILocation(line: 111, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !77, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!5, !5, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !15, line: 123, type: !5)
!83 = !DILocation(line: 123, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !15, line: 123, type: !79)
!85 = !DILocation(line: 123, column: 27, scope: !76)
!86 = !DILocation(line: 126, column: 22, scope: !76)
!87 = !DILocation(line: 126, column: 12, scope: !76)
!88 = !DILocation(line: 126, column: 5, scope: !76)
!89 = !DILocation(line: 128, column: 5, scope: !76)
!90 = !DILocation(line: 129, column: 5, scope: !76)
!91 = !DILocation(line: 130, column: 5, scope: !76)
!92 = !DILocation(line: 133, column: 5, scope: !76)
!93 = !DILocation(line: 134, column: 5, scope: !76)
!94 = !DILocation(line: 135, column: 5, scope: !76)
!95 = !DILocation(line: 137, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 53, type: !4)
!98 = !DILocation(line: 53, column: 11, scope: !96)
!99 = !DILocation(line: 54, column: 10, scope: !96)
!100 = !DILocation(line: 55, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 55, column: 8)
!102 = !DILocation(line: 55, column: 25, scope: !101)
!103 = !DILocation(line: 55, column: 8, scope: !96)
!104 = !DILocation(line: 58, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 56, column: 5)
!106 = !DILocation(line: 59, column: 5, scope: !105)
!107 = !DILocation(line: 63, column: 23, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !15, line: 61, column: 5)
!109 = !DILocation(line: 63, column: 16, scope: !108)
!110 = !DILocation(line: 63, column: 14, scope: !108)
!111 = !DILocation(line: 64, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 64, column: 13)
!113 = !DILocation(line: 64, column: 18, scope: !112)
!114 = !DILocation(line: 64, column: 13, scope: !108)
!115 = !DILocation(line: 64, column: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 64, column: 27)
!117 = !DILocalVariable(name: "source", scope: !118, file: !15, line: 67, type: !38)
!118 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 5)
!119 = !DILocation(line: 67, column: 13, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !15, line: 69, type: !44)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 68, column: 9)
!122 = !DILocation(line: 69, column: 20, scope: !121)
!123 = !DILocation(line: 71, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 71, column: 13)
!125 = !DILocation(line: 71, column: 18, scope: !124)
!126 = !DILocation(line: 71, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 27, scope: !127)
!129 = !DILocation(line: 71, column: 13, scope: !124)
!130 = !DILocation(line: 73, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 72, column: 13)
!132 = !DILocation(line: 73, column: 27, scope: !131)
!133 = !DILocation(line: 73, column: 17, scope: !131)
!134 = !DILocation(line: 73, column: 22, scope: !131)
!135 = !DILocation(line: 73, column: 25, scope: !131)
!136 = !DILocation(line: 74, column: 13, scope: !131)
!137 = !DILocation(line: 71, column: 35, scope: !127)
!138 = !DILocation(line: 71, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !66}
!140 = !DILocation(line: 74, column: 13, scope: !124)
!141 = !DILocation(line: 75, column: 26, scope: !121)
!142 = !DILocation(line: 75, column: 13, scope: !121)
!143 = !DILocation(line: 76, column: 18, scope: !121)
!144 = !DILocation(line: 76, column: 13, scope: !121)
!145 = !DILocation(line: 79, column: 1, scope: !96)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !15, line: 84, type: !4)
!148 = !DILocation(line: 84, column: 11, scope: !146)
!149 = !DILocation(line: 85, column: 10, scope: !146)
!150 = !DILocation(line: 86, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !15, line: 86, column: 8)
!152 = !DILocation(line: 86, column: 25, scope: !151)
!153 = !DILocation(line: 86, column: 8, scope: !146)
!154 = !DILocation(line: 89, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 87, column: 5)
!156 = !DILocation(line: 89, column: 16, scope: !155)
!157 = !DILocation(line: 89, column: 14, scope: !155)
!158 = !DILocation(line: 90, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 90, column: 13)
!160 = !DILocation(line: 90, column: 18, scope: !159)
!161 = !DILocation(line: 90, column: 13, scope: !155)
!162 = !DILocation(line: 90, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !15, line: 90, column: 27)
!164 = !DILocation(line: 91, column: 5, scope: !155)
!165 = !DILocalVariable(name: "source", scope: !166, file: !15, line: 93, type: !38)
!166 = distinct !DILexicalBlock(scope: !146, file: !15, line: 92, column: 5)
!167 = !DILocation(line: 93, column: 13, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !169, file: !15, line: 95, type: !44)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 94, column: 9)
!170 = !DILocation(line: 95, column: 20, scope: !169)
!171 = !DILocation(line: 97, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 97, column: 13)
!173 = !DILocation(line: 97, column: 18, scope: !172)
!174 = !DILocation(line: 97, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 97, column: 13)
!176 = !DILocation(line: 97, column: 27, scope: !175)
!177 = !DILocation(line: 97, column: 13, scope: !172)
!178 = !DILocation(line: 99, column: 34, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !15, line: 98, column: 13)
!180 = !DILocation(line: 99, column: 27, scope: !179)
!181 = !DILocation(line: 99, column: 17, scope: !179)
!182 = !DILocation(line: 99, column: 22, scope: !179)
!183 = !DILocation(line: 99, column: 25, scope: !179)
!184 = !DILocation(line: 100, column: 13, scope: !179)
!185 = !DILocation(line: 97, column: 35, scope: !175)
!186 = !DILocation(line: 97, column: 13, scope: !175)
!187 = distinct !{!187, !177, !188, !66}
!188 = !DILocation(line: 100, column: 13, scope: !172)
!189 = !DILocation(line: 101, column: 26, scope: !169)
!190 = !DILocation(line: 101, column: 13, scope: !169)
!191 = !DILocation(line: 102, column: 18, scope: !169)
!192 = !DILocation(line: 102, column: 13, scope: !169)
!193 = !DILocation(line: 105, column: 1, scope: !146)
