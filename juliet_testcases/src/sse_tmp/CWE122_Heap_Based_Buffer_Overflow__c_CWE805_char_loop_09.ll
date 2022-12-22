; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !26
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %1, null, !dbg !29
  br i1 %cmp, label %if.then1, label %if.end, !dbg !30

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end2, !dbg !35

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx3, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !53
  %cmp4 = icmp ult i64 %3, 100, !dbg !55
  br i1 %cmp4, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i8, i8* %arrayidx5, align 1, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !60
  store i8 %5, i8* %arrayidx6, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !69
  store i8 0, i8* %arrayidx7, align 1, !dbg !70
  %10 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %10), !dbg !72
  %11 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* %11) #6, !dbg !74
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

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_good() #0 !dbg !76 {
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
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end2, !dbg !108

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %1, null, !dbg !114
  br i1 %cmp, label %if.then1, label %if.end, !dbg !115

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !131
  %cmp4 = icmp ult i64 %3, 100, !dbg !133
  br i1 %cmp4, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !137
  %5 = load i8, i8* %arrayidx5, align 1, !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  %7 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !138
  store i8 %5, i8* %arrayidx6, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %8, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !146
  store i8 0, i8* %arrayidx7, align 1, !dbg !147
  %10 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %10), !dbg !149
  %11 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %11) #6, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i8* null, i8** %data, align 8, !dbg !156
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !157
  %tobool = icmp ne i32 %0, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end2, !dbg !159

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !160
  store i8* %call, i8** %data, align 8, !dbg !162
  %1 = load i8*, i8** %data, align 8, !dbg !163
  %cmp = icmp eq i8* %1, null, !dbg !165
  br i1 %cmp, label %if.then1, label %if.end, !dbg !166

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  br label %if.end2, !dbg !171

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !177
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !178
  store i8 0, i8* %arrayidx3, align 1, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end2
  %3 = load i64, i64* %i, align 8, !dbg !183
  %cmp4 = icmp ult i64 %3, 100, !dbg !185
  br i1 %cmp4, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %4, !dbg !189
  %5 = load i8, i8* %arrayidx5, align 1, !dbg !189
  %6 = load i8*, i8** %data, align 8, !dbg !190
  %7 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !190
  store i8 %5, i8* %arrayidx6, align 1, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %8, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !198
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !198
  store i8 0, i8* %arrayidx7, align 1, !dbg !199
  %10 = load i8*, i8** %data, align 8, !dbg !200
  call void @printLine(i8* %10), !dbg !201
  %11 = load i8*, i8** %data, align 8, !dbg !202
  call void @free(i8* %11) #6, !dbg !203
  ret void, !dbg !204
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 9, scope: !25)
!34 = !DILocation(line: 32, column: 17, scope: !25)
!35 = !DILocation(line: 33, column: 5, scope: !25)
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 36, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 14, scope: !37)
!47 = !DILocation(line: 37, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 9, scope: !37)
!49 = !DILocation(line: 38, column: 23, scope: !37)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !15, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 23, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !58)
!61 = !DILocation(line: 42, column: 18, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 31, scope: !54)
!65 = !DILocation(line: 40, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 44, column: 9, scope: !37)
!70 = !DILocation(line: 44, column: 21, scope: !37)
!71 = !DILocation(line: 45, column: 19, scope: !37)
!72 = !DILocation(line: 45, column: 9, scope: !37)
!73 = !DILocation(line: 46, column: 14, scope: !37)
!74 = !DILocation(line: 46, column: 9, scope: !37)
!75 = !DILocation(line: 48, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_09_good", scope: !15, file: !15, line: 115, type: !16, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 117, column: 5, scope: !76)
!78 = !DILocation(line: 118, column: 5, scope: !76)
!79 = !DILocation(line: 119, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 131, type: !81, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 131, type: !83)
!86 = !DILocation(line: 131, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 131, type: !84)
!88 = !DILocation(line: 131, column: 27, scope: !80)
!89 = !DILocation(line: 134, column: 22, scope: !80)
!90 = !DILocation(line: 134, column: 12, scope: !80)
!91 = !DILocation(line: 134, column: 5, scope: !80)
!92 = !DILocation(line: 136, column: 5, scope: !80)
!93 = !DILocation(line: 137, column: 5, scope: !80)
!94 = !DILocation(line: 138, column: 5, scope: !80)
!95 = !DILocation(line: 141, column: 5, scope: !80)
!96 = !DILocation(line: 142, column: 5, scope: !80)
!97 = !DILocation(line: 143, column: 5, scope: !80)
!98 = !DILocation(line: 145, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 57, type: !4)
!101 = !DILocation(line: 57, column: 12, scope: !99)
!102 = !DILocation(line: 58, column: 10, scope: !99)
!103 = !DILocation(line: 59, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 59, column: 8)
!105 = !DILocation(line: 59, column: 8, scope: !99)
!106 = !DILocation(line: 62, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 60, column: 5)
!108 = !DILocation(line: 63, column: 5, scope: !107)
!109 = !DILocation(line: 67, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 65, column: 5)
!111 = !DILocation(line: 67, column: 14, scope: !110)
!112 = !DILocation(line: 68, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !15, line: 68, column: 13)
!114 = !DILocation(line: 68, column: 18, scope: !113)
!115 = !DILocation(line: 68, column: 13, scope: !110)
!116 = !DILocation(line: 68, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 68, column: 27)
!118 = !DILocation(line: 69, column: 9, scope: !110)
!119 = !DILocation(line: 69, column: 17, scope: !110)
!120 = !DILocalVariable(name: "i", scope: !121, file: !15, line: 72, type: !38)
!121 = distinct !DILexicalBlock(scope: !99, file: !15, line: 71, column: 5)
!122 = !DILocation(line: 72, column: 16, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !15, line: 73, type: !43)
!124 = !DILocation(line: 73, column: 14, scope: !121)
!125 = !DILocation(line: 74, column: 9, scope: !121)
!126 = !DILocation(line: 75, column: 9, scope: !121)
!127 = !DILocation(line: 75, column: 23, scope: !121)
!128 = !DILocation(line: 77, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !15, line: 77, column: 9)
!130 = !DILocation(line: 77, column: 14, scope: !129)
!131 = !DILocation(line: 77, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 77, column: 9)
!133 = !DILocation(line: 77, column: 23, scope: !132)
!134 = !DILocation(line: 77, column: 9, scope: !129)
!135 = !DILocation(line: 79, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 78, column: 9)
!137 = !DILocation(line: 79, column: 23, scope: !136)
!138 = !DILocation(line: 79, column: 13, scope: !136)
!139 = !DILocation(line: 79, column: 18, scope: !136)
!140 = !DILocation(line: 79, column: 21, scope: !136)
!141 = !DILocation(line: 80, column: 9, scope: !136)
!142 = !DILocation(line: 77, column: 31, scope: !132)
!143 = !DILocation(line: 77, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !68}
!145 = !DILocation(line: 80, column: 9, scope: !129)
!146 = !DILocation(line: 81, column: 9, scope: !121)
!147 = !DILocation(line: 81, column: 21, scope: !121)
!148 = !DILocation(line: 82, column: 19, scope: !121)
!149 = !DILocation(line: 82, column: 9, scope: !121)
!150 = !DILocation(line: 83, column: 14, scope: !121)
!151 = !DILocation(line: 83, column: 9, scope: !121)
!152 = !DILocation(line: 85, column: 1, scope: !99)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !15, line: 90, type: !4)
!155 = !DILocation(line: 90, column: 12, scope: !153)
!156 = !DILocation(line: 91, column: 10, scope: !153)
!157 = !DILocation(line: 92, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !15, line: 92, column: 8)
!159 = !DILocation(line: 92, column: 8, scope: !153)
!160 = !DILocation(line: 95, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 93, column: 5)
!162 = !DILocation(line: 95, column: 14, scope: !161)
!163 = !DILocation(line: 96, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 96, column: 13)
!165 = !DILocation(line: 96, column: 18, scope: !164)
!166 = !DILocation(line: 96, column: 13, scope: !161)
!167 = !DILocation(line: 96, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 96, column: 27)
!169 = !DILocation(line: 97, column: 9, scope: !161)
!170 = !DILocation(line: 97, column: 17, scope: !161)
!171 = !DILocation(line: 98, column: 5, scope: !161)
!172 = !DILocalVariable(name: "i", scope: !173, file: !15, line: 100, type: !38)
!173 = distinct !DILexicalBlock(scope: !153, file: !15, line: 99, column: 5)
!174 = !DILocation(line: 100, column: 16, scope: !173)
!175 = !DILocalVariable(name: "source", scope: !173, file: !15, line: 101, type: !43)
!176 = !DILocation(line: 101, column: 14, scope: !173)
!177 = !DILocation(line: 102, column: 9, scope: !173)
!178 = !DILocation(line: 103, column: 9, scope: !173)
!179 = !DILocation(line: 103, column: 23, scope: !173)
!180 = !DILocation(line: 105, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !173, file: !15, line: 105, column: 9)
!182 = !DILocation(line: 105, column: 14, scope: !181)
!183 = !DILocation(line: 105, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 105, column: 9)
!185 = !DILocation(line: 105, column: 23, scope: !184)
!186 = !DILocation(line: 105, column: 9, scope: !181)
!187 = !DILocation(line: 107, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !15, line: 106, column: 9)
!189 = !DILocation(line: 107, column: 23, scope: !188)
!190 = !DILocation(line: 107, column: 13, scope: !188)
!191 = !DILocation(line: 107, column: 18, scope: !188)
!192 = !DILocation(line: 107, column: 21, scope: !188)
!193 = !DILocation(line: 108, column: 9, scope: !188)
!194 = !DILocation(line: 105, column: 31, scope: !184)
!195 = !DILocation(line: 105, column: 9, scope: !184)
!196 = distinct !{!196, !186, !197, !68}
!197 = !DILocation(line: 108, column: 9, scope: !181)
!198 = !DILocation(line: 109, column: 9, scope: !173)
!199 = !DILocation(line: 109, column: 21, scope: !173)
!200 = !DILocation(line: 110, column: 19, scope: !173)
!201 = !DILocation(line: 110, column: 9, scope: !173)
!202 = !DILocation(line: 111, column: 14, scope: !173)
!203 = !DILocation(line: 111, column: 9, scope: !173)
!204 = !DILocation(line: 113, column: 1, scope: !153)
