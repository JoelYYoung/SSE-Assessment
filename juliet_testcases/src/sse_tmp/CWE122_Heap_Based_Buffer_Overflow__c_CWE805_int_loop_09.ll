; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !24
  %1 = bitcast i8* %call to i32*, !dbg !26
  store i32* %1, i32** %data, align 8, !dbg !27
  %2 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !34

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !50
  %cmp3 = icmp ult i64 %4, 100, !dbg !52
  br i1 %cmp3, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !56
  %6 = load i32, i32* %arrayidx, align 4, !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !57
  store i32 %6, i32* %arrayidx4, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %9, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !66
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !66
  call void @printIntLine(i32 %11), !dbg !67
  %12 = load i32*, i32** %data, align 8, !dbg !68
  %13 = bitcast i32* %12 to i8*, !dbg !68
  call void @free(i8* %13) #6, !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end2, !dbg !104

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !105
  %1 = bitcast i8* %call to i32*, !dbg !107
  store i32* %1, i32** %data, align 8, !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %cmp = icmp eq i32* %2, null, !dbg !111
  br i1 %cmp, label %if.then1, label %if.end, !dbg !112

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !124
  %cmp3 = icmp ult i64 %4, 100, !dbg !126
  br i1 %cmp3, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !130
  %6 = load i32, i32* %arrayidx, align 4, !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %8 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !131
  store i32 %6, i32* %arrayidx4, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %9, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !139
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !139
  call void @printIntLine(i32 %11), !dbg !140
  %12 = load i32*, i32** %data, align 8, !dbg !141
  %13 = bitcast i32* %12 to i8*, !dbg !141
  call void @free(i8* %13) #6, !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  store i32* null, i32** %data, align 8, !dbg !147
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !148
  %tobool = icmp ne i32 %0, 0, !dbg !148
  br i1 %tobool, label %if.then, label %if.end2, !dbg !150

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !151
  %1 = bitcast i8* %call to i32*, !dbg !153
  store i32* %1, i32** %data, align 8, !dbg !154
  %2 = load i32*, i32** %data, align 8, !dbg !155
  %cmp = icmp eq i32* %2, null, !dbg !157
  br i1 %cmp, label %if.then1, label %if.end, !dbg !158

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !159
  unreachable, !dbg !159

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !161

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  %3 = bitcast [100 x i32]* %source to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 400, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !171
  %cmp3 = icmp ult i64 %4, 100, !dbg !173
  br i1 %cmp3, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !177
  %6 = load i32, i32* %arrayidx, align 4, !dbg !177
  %7 = load i32*, i32** %data, align 8, !dbg !178
  %8 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !178
  store i32 %6, i32* %arrayidx4, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %9, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !186
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 0, !dbg !186
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !186
  call void @printIntLine(i32 %11), !dbg !187
  %12 = load i32*, i32** %data, align 8, !dbg !188
  %13 = bitcast i32* %12 to i8*, !dbg !188
  call void @free(i8* %13) #6, !dbg !189
  ret void, !dbg !190
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 25, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 8)
!23 = !DILocation(line: 25, column: 8, scope: !14)
!24 = !DILocation(line: 28, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 26, column: 5)
!26 = !DILocation(line: 28, column: 16, scope: !25)
!27 = !DILocation(line: 28, column: 14, scope: !25)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 18, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !25)
!32 = !DILocation(line: 29, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 27)
!34 = !DILocation(line: 30, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 32, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 34, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !15, line: 33, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 34, column: 20, scope: !42)
!47 = !DILocation(line: 36, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !15, line: 36, column: 13)
!49 = !DILocation(line: 36, column: 18, scope: !48)
!50 = !DILocation(line: 36, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 36, column: 13)
!52 = !DILocation(line: 36, column: 27, scope: !51)
!53 = !DILocation(line: 36, column: 13, scope: !48)
!54 = !DILocation(line: 38, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 37, column: 13)
!56 = !DILocation(line: 38, column: 27, scope: !55)
!57 = !DILocation(line: 38, column: 17, scope: !55)
!58 = !DILocation(line: 38, column: 22, scope: !55)
!59 = !DILocation(line: 38, column: 25, scope: !55)
!60 = !DILocation(line: 39, column: 13, scope: !55)
!61 = !DILocation(line: 36, column: 35, scope: !51)
!62 = !DILocation(line: 36, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 39, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 40, column: 26, scope: !42)
!67 = !DILocation(line: 40, column: 13, scope: !42)
!68 = !DILocation(line: 41, column: 18, scope: !42)
!69 = !DILocation(line: 41, column: 13, scope: !42)
!70 = !DILocation(line: 44, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_09_good", scope: !15, file: !15, line: 107, type: !16, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 109, column: 5, scope: !71)
!73 = !DILocation(line: 110, column: 5, scope: !71)
!74 = !DILocation(line: 111, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 123, type: !76, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!5, !5, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 123, type: !5)
!82 = !DILocation(line: 123, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 123, type: !78)
!84 = !DILocation(line: 123, column: 27, scope: !75)
!85 = !DILocation(line: 126, column: 22, scope: !75)
!86 = !DILocation(line: 126, column: 12, scope: !75)
!87 = !DILocation(line: 126, column: 5, scope: !75)
!88 = !DILocation(line: 128, column: 5, scope: !75)
!89 = !DILocation(line: 129, column: 5, scope: !75)
!90 = !DILocation(line: 130, column: 5, scope: !75)
!91 = !DILocation(line: 133, column: 5, scope: !75)
!92 = !DILocation(line: 134, column: 5, scope: !75)
!93 = !DILocation(line: 135, column: 5, scope: !75)
!94 = !DILocation(line: 137, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 53, type: !4)
!97 = !DILocation(line: 53, column: 11, scope: !95)
!98 = !DILocation(line: 54, column: 10, scope: !95)
!99 = !DILocation(line: 55, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !15, line: 55, column: 8)
!101 = !DILocation(line: 55, column: 8, scope: !95)
!102 = !DILocation(line: 58, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !15, line: 56, column: 5)
!104 = !DILocation(line: 59, column: 5, scope: !103)
!105 = !DILocation(line: 63, column: 23, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !15, line: 61, column: 5)
!107 = !DILocation(line: 63, column: 16, scope: !106)
!108 = !DILocation(line: 63, column: 14, scope: !106)
!109 = !DILocation(line: 64, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !15, line: 64, column: 13)
!111 = !DILocation(line: 64, column: 18, scope: !110)
!112 = !DILocation(line: 64, column: 13, scope: !106)
!113 = !DILocation(line: 64, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 64, column: 27)
!115 = !DILocalVariable(name: "source", scope: !116, file: !15, line: 67, type: !37)
!116 = distinct !DILexicalBlock(scope: !95, file: !15, line: 66, column: 5)
!117 = !DILocation(line: 67, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 69, type: !43)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 68, column: 9)
!120 = !DILocation(line: 69, column: 20, scope: !119)
!121 = !DILocation(line: 71, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 71, column: 13)
!123 = !DILocation(line: 71, column: 18, scope: !122)
!124 = !DILocation(line: 71, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 71, column: 13)
!126 = !DILocation(line: 71, column: 27, scope: !125)
!127 = !DILocation(line: 71, column: 13, scope: !122)
!128 = !DILocation(line: 73, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 72, column: 13)
!130 = !DILocation(line: 73, column: 27, scope: !129)
!131 = !DILocation(line: 73, column: 17, scope: !129)
!132 = !DILocation(line: 73, column: 22, scope: !129)
!133 = !DILocation(line: 73, column: 25, scope: !129)
!134 = !DILocation(line: 74, column: 13, scope: !129)
!135 = !DILocation(line: 71, column: 35, scope: !125)
!136 = !DILocation(line: 71, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !65}
!138 = !DILocation(line: 74, column: 13, scope: !122)
!139 = !DILocation(line: 75, column: 26, scope: !119)
!140 = !DILocation(line: 75, column: 13, scope: !119)
!141 = !DILocation(line: 76, column: 18, scope: !119)
!142 = !DILocation(line: 76, column: 13, scope: !119)
!143 = !DILocation(line: 79, column: 1, scope: !95)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", scope: !144, file: !15, line: 84, type: !4)
!146 = !DILocation(line: 84, column: 11, scope: !144)
!147 = !DILocation(line: 85, column: 10, scope: !144)
!148 = !DILocation(line: 86, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !15, line: 86, column: 8)
!150 = !DILocation(line: 86, column: 8, scope: !144)
!151 = !DILocation(line: 89, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !15, line: 87, column: 5)
!153 = !DILocation(line: 89, column: 16, scope: !152)
!154 = !DILocation(line: 89, column: 14, scope: !152)
!155 = !DILocation(line: 90, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 90, column: 13)
!157 = !DILocation(line: 90, column: 18, scope: !156)
!158 = !DILocation(line: 90, column: 13, scope: !152)
!159 = !DILocation(line: 90, column: 28, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 90, column: 27)
!161 = !DILocation(line: 91, column: 5, scope: !152)
!162 = !DILocalVariable(name: "source", scope: !163, file: !15, line: 93, type: !37)
!163 = distinct !DILexicalBlock(scope: !144, file: !15, line: 92, column: 5)
!164 = !DILocation(line: 93, column: 13, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !15, line: 95, type: !43)
!166 = distinct !DILexicalBlock(scope: !163, file: !15, line: 94, column: 9)
!167 = !DILocation(line: 95, column: 20, scope: !166)
!168 = !DILocation(line: 97, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !15, line: 97, column: 13)
!170 = !DILocation(line: 97, column: 18, scope: !169)
!171 = !DILocation(line: 97, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 97, column: 13)
!173 = !DILocation(line: 97, column: 27, scope: !172)
!174 = !DILocation(line: 97, column: 13, scope: !169)
!175 = !DILocation(line: 99, column: 34, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !15, line: 98, column: 13)
!177 = !DILocation(line: 99, column: 27, scope: !176)
!178 = !DILocation(line: 99, column: 17, scope: !176)
!179 = !DILocation(line: 99, column: 22, scope: !176)
!180 = !DILocation(line: 99, column: 25, scope: !176)
!181 = !DILocation(line: 100, column: 13, scope: !176)
!182 = !DILocation(line: 97, column: 35, scope: !172)
!183 = !DILocation(line: 97, column: 13, scope: !172)
!184 = distinct !{!184, !174, !185, !65}
!185 = !DILocation(line: 100, column: 13, scope: !169)
!186 = !DILocation(line: 101, column: 26, scope: !166)
!187 = !DILocation(line: 101, column: 13, scope: !166)
!188 = !DILocation(line: 102, column: 18, scope: !166)
!189 = !DILocation(line: 102, column: 13, scope: !166)
!190 = !DILocation(line: 105, column: 1, scope: !144)
