; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32* null, i32** %data, align 8, !dbg !23
  %0 = load i32, i32* @staticFive, align 4, !dbg !24
  %cmp = icmp eq i32 %0, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !28
  %1 = bitcast i8* %call to i32*, !dbg !30
  store i32* %1, i32** %data, align 8, !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %cmp1 = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !54
  %cmp4 = icmp ult i64 %4, 100, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !60
  %6 = load i32, i32* %arrayidx, align 4, !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !61
  store i32 %6, i32* %arrayidx5, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %9, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !70
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !70
  call void @printIntLine(i32 %11), !dbg !71
  %12 = load i32*, i32** %data, align 8, !dbg !72
  %13 = bitcast i32* %12 to i8*, !dbg !72
  call void @free(i8* %13) #6, !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  %0 = load i32, i32* @staticFive, align 4, !dbg !103
  %cmp = icmp ne i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end3, !dbg !109

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !110
  %1 = bitcast i8* %call to i32*, !dbg !112
  store i32* %1, i32** %data, align 8, !dbg !113
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %cmp1 = icmp eq i32* %2, null, !dbg !116
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp4 = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp4, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i32, i32* %arrayidx, align 4, !dbg !135
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !136
  store i32 %6, i32* %arrayidx5, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !144
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !144
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !153
  %cmp = icmp eq i32 %0, 5, !dbg !155
  br i1 %cmp, label %if.then, label %if.end3, !dbg !156

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !157
  %1 = bitcast i8* %call to i32*, !dbg !159
  store i32* %1, i32** %data, align 8, !dbg !160
  %2 = load i32*, i32** %data, align 8, !dbg !161
  %cmp1 = icmp eq i32* %2, null, !dbg !163
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !164

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !167

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !177
  %cmp4 = icmp ult i64 %4, 100, !dbg !179
  br i1 %cmp4, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !183
  %6 = load i32, i32* %arrayidx, align 4, !dbg !183
  %7 = load i32*, i32** %data, align 8, !dbg !184
  %8 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !184
  store i32 %6, i32* %arrayidx5, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %9, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !192
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !192
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !192
  call void @printIntLine(i32 %11), !dbg !193
  %12 = load i32*, i32** %data, align 8, !dbg !194
  %13 = bitcast i32* %12 to i8*, !dbg !194
  call void @free(i8* %13) #6, !dbg !195
  ret void, !dbg !196
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_bad", scope: !11, file: !11, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !11, line: 29, type: !6)
!22 = !DILocation(line: 29, column: 11, scope: !18)
!23 = !DILocation(line: 30, column: 10, scope: !18)
!24 = !DILocation(line: 31, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !11, line: 31, column: 8)
!26 = !DILocation(line: 31, column: 18, scope: !25)
!27 = !DILocation(line: 31, column: 8, scope: !18)
!28 = !DILocation(line: 34, column: 23, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !11, line: 32, column: 5)
!30 = !DILocation(line: 34, column: 16, scope: !29)
!31 = !DILocation(line: 34, column: 14, scope: !29)
!32 = !DILocation(line: 35, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !11, line: 35, column: 13)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 13, scope: !29)
!36 = !DILocation(line: 35, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 35, column: 27)
!38 = !DILocation(line: 36, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !11, line: 37, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 38, column: 13, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !11, line: 40, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !11, line: 39, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 40, column: 20, scope: !46)
!51 = !DILocation(line: 42, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !11, line: 42, column: 13)
!53 = !DILocation(line: 42, column: 18, scope: !52)
!54 = !DILocation(line: 42, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !11, line: 42, column: 13)
!56 = !DILocation(line: 42, column: 27, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !52)
!58 = !DILocation(line: 44, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !11, line: 43, column: 13)
!60 = !DILocation(line: 44, column: 27, scope: !59)
!61 = !DILocation(line: 44, column: 17, scope: !59)
!62 = !DILocation(line: 44, column: 22, scope: !59)
!63 = !DILocation(line: 44, column: 25, scope: !59)
!64 = !DILocation(line: 45, column: 13, scope: !59)
!65 = !DILocation(line: 42, column: 35, scope: !55)
!66 = !DILocation(line: 42, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 45, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 46, column: 26, scope: !46)
!71 = !DILocation(line: 46, column: 13, scope: !46)
!72 = !DILocation(line: 47, column: 18, scope: !46)
!73 = !DILocation(line: 47, column: 13, scope: !46)
!74 = !DILocation(line: 50, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_07_good", scope: !11, file: !11, line: 113, type: !19, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 115, column: 5, scope: !75)
!77 = !DILocation(line: 116, column: 5, scope: !75)
!78 = !DILocation(line: 117, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 129, type: !80, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !11, line: 129, type: !7)
!86 = !DILocation(line: 129, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !11, line: 129, type: !82)
!88 = !DILocation(line: 129, column: 27, scope: !79)
!89 = !DILocation(line: 132, column: 22, scope: !79)
!90 = !DILocation(line: 132, column: 12, scope: !79)
!91 = !DILocation(line: 132, column: 5, scope: !79)
!92 = !DILocation(line: 134, column: 5, scope: !79)
!93 = !DILocation(line: 135, column: 5, scope: !79)
!94 = !DILocation(line: 136, column: 5, scope: !79)
!95 = !DILocation(line: 139, column: 5, scope: !79)
!96 = !DILocation(line: 140, column: 5, scope: !79)
!97 = !DILocation(line: 141, column: 5, scope: !79)
!98 = !DILocation(line: 143, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !11, line: 59, type: !6)
!101 = !DILocation(line: 59, column: 11, scope: !99)
!102 = !DILocation(line: 60, column: 10, scope: !99)
!103 = !DILocation(line: 61, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !11, line: 61, column: 8)
!105 = !DILocation(line: 61, column: 18, scope: !104)
!106 = !DILocation(line: 61, column: 8, scope: !99)
!107 = !DILocation(line: 64, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !11, line: 62, column: 5)
!109 = !DILocation(line: 65, column: 5, scope: !108)
!110 = !DILocation(line: 69, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !11, line: 67, column: 5)
!112 = !DILocation(line: 69, column: 16, scope: !111)
!113 = !DILocation(line: 69, column: 14, scope: !111)
!114 = !DILocation(line: 70, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !11, line: 70, column: 13)
!116 = !DILocation(line: 70, column: 18, scope: !115)
!117 = !DILocation(line: 70, column: 13, scope: !111)
!118 = !DILocation(line: 70, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !11, line: 70, column: 27)
!120 = !DILocalVariable(name: "source", scope: !121, file: !11, line: 73, type: !41)
!121 = distinct !DILexicalBlock(scope: !99, file: !11, line: 72, column: 5)
!122 = !DILocation(line: 73, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !11, line: 75, type: !47)
!124 = distinct !DILexicalBlock(scope: !121, file: !11, line: 74, column: 9)
!125 = !DILocation(line: 75, column: 20, scope: !124)
!126 = !DILocation(line: 77, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !11, line: 77, column: 13)
!128 = !DILocation(line: 77, column: 18, scope: !127)
!129 = !DILocation(line: 77, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !11, line: 77, column: 13)
!131 = !DILocation(line: 77, column: 27, scope: !130)
!132 = !DILocation(line: 77, column: 13, scope: !127)
!133 = !DILocation(line: 79, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !11, line: 78, column: 13)
!135 = !DILocation(line: 79, column: 27, scope: !134)
!136 = !DILocation(line: 79, column: 17, scope: !134)
!137 = !DILocation(line: 79, column: 22, scope: !134)
!138 = !DILocation(line: 79, column: 25, scope: !134)
!139 = !DILocation(line: 80, column: 13, scope: !134)
!140 = !DILocation(line: 77, column: 35, scope: !130)
!141 = !DILocation(line: 77, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !69}
!143 = !DILocation(line: 80, column: 13, scope: !127)
!144 = !DILocation(line: 81, column: 26, scope: !124)
!145 = !DILocation(line: 81, column: 13, scope: !124)
!146 = !DILocation(line: 82, column: 18, scope: !124)
!147 = !DILocation(line: 82, column: 13, scope: !124)
!148 = !DILocation(line: 85, column: 1, scope: !99)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !11, line: 90, type: !6)
!151 = !DILocation(line: 90, column: 11, scope: !149)
!152 = !DILocation(line: 91, column: 10, scope: !149)
!153 = !DILocation(line: 92, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !11, line: 92, column: 8)
!155 = !DILocation(line: 92, column: 18, scope: !154)
!156 = !DILocation(line: 92, column: 8, scope: !149)
!157 = !DILocation(line: 95, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !11, line: 93, column: 5)
!159 = !DILocation(line: 95, column: 16, scope: !158)
!160 = !DILocation(line: 95, column: 14, scope: !158)
!161 = !DILocation(line: 96, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !11, line: 96, column: 13)
!163 = !DILocation(line: 96, column: 18, scope: !162)
!164 = !DILocation(line: 96, column: 13, scope: !158)
!165 = !DILocation(line: 96, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !11, line: 96, column: 27)
!167 = !DILocation(line: 97, column: 5, scope: !158)
!168 = !DILocalVariable(name: "source", scope: !169, file: !11, line: 99, type: !41)
!169 = distinct !DILexicalBlock(scope: !149, file: !11, line: 98, column: 5)
!170 = !DILocation(line: 99, column: 13, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !11, line: 101, type: !47)
!172 = distinct !DILexicalBlock(scope: !169, file: !11, line: 100, column: 9)
!173 = !DILocation(line: 101, column: 20, scope: !172)
!174 = !DILocation(line: 103, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !11, line: 103, column: 13)
!176 = !DILocation(line: 103, column: 18, scope: !175)
!177 = !DILocation(line: 103, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !11, line: 103, column: 13)
!179 = !DILocation(line: 103, column: 27, scope: !178)
!180 = !DILocation(line: 103, column: 13, scope: !175)
!181 = !DILocation(line: 105, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !11, line: 104, column: 13)
!183 = !DILocation(line: 105, column: 27, scope: !182)
!184 = !DILocation(line: 105, column: 17, scope: !182)
!185 = !DILocation(line: 105, column: 22, scope: !182)
!186 = !DILocation(line: 105, column: 25, scope: !182)
!187 = !DILocation(line: 106, column: 13, scope: !182)
!188 = !DILocation(line: 103, column: 35, scope: !178)
!189 = !DILocation(line: 103, column: 13, scope: !178)
!190 = distinct !{!190, !180, !191, !69}
!191 = !DILocation(line: 106, column: 13, scope: !175)
!192 = !DILocation(line: 107, column: 26, scope: !172)
!193 = !DILocation(line: 107, column: 13, scope: !172)
!194 = !DILocation(line: 108, column: 18, scope: !172)
!195 = !DILocation(line: 108, column: 13, scope: !172)
!196 = !DILocation(line: 111, column: 1, scope: !149)
