; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @globalFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !29
  %1 = bitcast i8* %call to i64*, !dbg !31
  store i64* %1, i64** %data, align 8, !dbg !32
  %2 = load i64*, i64** %data, align 8, !dbg !33
  %cmp1 = icmp eq i64* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !39

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !55
  %cmp4 = icmp ult i64 %4, 100, !dbg !57
  br i1 %cmp4, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !61
  %6 = load i64, i64* %arrayidx, align 8, !dbg !61
  %7 = load i64*, i64** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !62
  store i64 %6, i64* %arrayidx5, align 8, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %9, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !71
  %11 = load i64, i64* %arrayidx6, align 8, !dbg !71
  call void @printLongLongLine(i64 %11), !dbg !72
  %12 = load i64*, i64** %data, align 8, !dbg !73
  %13 = bitcast i64* %12 to i8*, !dbg !73
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

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_good() #0 !dbg !76 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store i64* null, i64** %data, align 8, !dbg !104
  %0 = load i32, i32* @globalFive, align 4, !dbg !105
  %cmp = icmp ne i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end3, !dbg !111

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !112
  %1 = bitcast i8* %call to i64*, !dbg !114
  store i64* %1, i64** %data, align 8, !dbg !115
  %2 = load i64*, i64** %data, align 8, !dbg !116
  %cmp1 = icmp eq i64* %2, null, !dbg !118
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !131
  %cmp4 = icmp ult i64 %4, 100, !dbg !133
  br i1 %cmp4, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !137
  %6 = load i64, i64* %arrayidx, align 8, !dbg !137
  %7 = load i64*, i64** %data, align 8, !dbg !138
  %8 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !138
  store i64 %6, i64* %arrayidx5, align 8, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %9, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !146
  %11 = load i64, i64* %arrayidx6, align 8, !dbg !146
  call void @printLongLongLine(i64 %11), !dbg !147
  %12 = load i64*, i64** %data, align 8, !dbg !148
  %13 = bitcast i64* %12 to i8*, !dbg !148
  call void @free(i8* %13) #6, !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i64* null, i64** %data, align 8, !dbg !154
  %0 = load i32, i32* @globalFive, align 4, !dbg !155
  %cmp = icmp eq i32 %0, 5, !dbg !157
  br i1 %cmp, label %if.then, label %if.end3, !dbg !158

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !159
  %1 = bitcast i8* %call to i64*, !dbg !161
  store i64* %1, i64** %data, align 8, !dbg !162
  %2 = load i64*, i64** %data, align 8, !dbg !163
  %cmp1 = icmp eq i64* %2, null, !dbg !165
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !166

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !169

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load i64, i64* %i, align 8, !dbg !179
  %cmp4 = icmp ult i64 %4, 100, !dbg !181
  br i1 %cmp4, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !185
  %6 = load i64, i64* %arrayidx, align 8, !dbg !185
  %7 = load i64*, i64** %data, align 8, !dbg !186
  %8 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !186
  store i64 %6, i64* %arrayidx5, align 8, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %9, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !194
  %arrayidx6 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !194
  %11 = load i64, i64* %arrayidx6, align 8, !dbg !194
  call void @printLongLongLine(i64 %11), !dbg !195
  %12 = load i64*, i64** %data, align 8, !dbg !196
  %13 = bitcast i64* %12 to i8*, !dbg !196
  call void @free(i8* %13) #6, !dbg !197
  ret void, !dbg !198
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 25, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 8)
!27 = !DILocation(line: 25, column: 18, scope: !26)
!28 = !DILocation(line: 25, column: 8, scope: !18)
!29 = !DILocation(line: 28, column: 27, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !19, line: 26, column: 5)
!31 = !DILocation(line: 28, column: 16, scope: !30)
!32 = !DILocation(line: 28, column: 14, scope: !30)
!33 = !DILocation(line: 29, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 29, column: 13)
!35 = !DILocation(line: 29, column: 18, scope: !34)
!36 = !DILocation(line: 29, column: 13, scope: !30)
!37 = !DILocation(line: 29, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 29, column: 27)
!39 = !DILocation(line: 30, column: 5, scope: !30)
!40 = !DILocalVariable(name: "source", scope: !41, file: !19, line: 32, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 32, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !19, line: 34, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !19, line: 33, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 34, column: 20, scope: !47)
!52 = !DILocation(line: 36, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !19, line: 36, column: 13)
!54 = !DILocation(line: 36, column: 18, scope: !53)
!55 = !DILocation(line: 36, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !19, line: 36, column: 13)
!57 = !DILocation(line: 36, column: 27, scope: !56)
!58 = !DILocation(line: 36, column: 13, scope: !53)
!59 = !DILocation(line: 38, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !19, line: 37, column: 13)
!61 = !DILocation(line: 38, column: 27, scope: !60)
!62 = !DILocation(line: 38, column: 17, scope: !60)
!63 = !DILocation(line: 38, column: 22, scope: !60)
!64 = !DILocation(line: 38, column: 25, scope: !60)
!65 = !DILocation(line: 39, column: 13, scope: !60)
!66 = !DILocation(line: 36, column: 35, scope: !56)
!67 = !DILocation(line: 36, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 39, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 40, column: 31, scope: !47)
!72 = !DILocation(line: 40, column: 13, scope: !47)
!73 = !DILocation(line: 41, column: 18, scope: !47)
!74 = !DILocation(line: 41, column: 13, scope: !47)
!75 = !DILocation(line: 44, column: 1, scope: !18)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_14_good", scope: !19, file: !19, line: 107, type: !20, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 109, column: 5, scope: !76)
!78 = !DILocation(line: 110, column: 5, scope: !76)
!79 = !DILocation(line: 111, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 123, type: !81, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !19, line: 123, type: !83)
!88 = !DILocation(line: 123, column: 14, scope: !80)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !19, line: 123, type: !84)
!90 = !DILocation(line: 123, column: 27, scope: !80)
!91 = !DILocation(line: 126, column: 22, scope: !80)
!92 = !DILocation(line: 126, column: 12, scope: !80)
!93 = !DILocation(line: 126, column: 5, scope: !80)
!94 = !DILocation(line: 128, column: 5, scope: !80)
!95 = !DILocation(line: 129, column: 5, scope: !80)
!96 = !DILocation(line: 130, column: 5, scope: !80)
!97 = !DILocation(line: 133, column: 5, scope: !80)
!98 = !DILocation(line: 134, column: 5, scope: !80)
!99 = !DILocation(line: 135, column: 5, scope: !80)
!100 = !DILocation(line: 137, column: 5, scope: !80)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !19, line: 53, type: !4)
!103 = !DILocation(line: 53, column: 15, scope: !101)
!104 = !DILocation(line: 54, column: 10, scope: !101)
!105 = !DILocation(line: 55, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !19, line: 55, column: 8)
!107 = !DILocation(line: 55, column: 18, scope: !106)
!108 = !DILocation(line: 55, column: 8, scope: !101)
!109 = !DILocation(line: 58, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !19, line: 56, column: 5)
!111 = !DILocation(line: 59, column: 5, scope: !110)
!112 = !DILocation(line: 63, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !19, line: 61, column: 5)
!114 = !DILocation(line: 63, column: 16, scope: !113)
!115 = !DILocation(line: 63, column: 14, scope: !113)
!116 = !DILocation(line: 64, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !19, line: 64, column: 13)
!118 = !DILocation(line: 64, column: 18, scope: !117)
!119 = !DILocation(line: 64, column: 13, scope: !113)
!120 = !DILocation(line: 64, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 64, column: 27)
!122 = !DILocalVariable(name: "source", scope: !123, file: !19, line: 67, type: !42)
!123 = distinct !DILexicalBlock(scope: !101, file: !19, line: 66, column: 5)
!124 = !DILocation(line: 67, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !19, line: 69, type: !48)
!126 = distinct !DILexicalBlock(scope: !123, file: !19, line: 68, column: 9)
!127 = !DILocation(line: 69, column: 20, scope: !126)
!128 = !DILocation(line: 71, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !19, line: 71, column: 13)
!130 = !DILocation(line: 71, column: 18, scope: !129)
!131 = !DILocation(line: 71, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !19, line: 71, column: 13)
!133 = !DILocation(line: 71, column: 27, scope: !132)
!134 = !DILocation(line: 71, column: 13, scope: !129)
!135 = !DILocation(line: 73, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !19, line: 72, column: 13)
!137 = !DILocation(line: 73, column: 27, scope: !136)
!138 = !DILocation(line: 73, column: 17, scope: !136)
!139 = !DILocation(line: 73, column: 22, scope: !136)
!140 = !DILocation(line: 73, column: 25, scope: !136)
!141 = !DILocation(line: 74, column: 13, scope: !136)
!142 = !DILocation(line: 71, column: 35, scope: !132)
!143 = !DILocation(line: 71, column: 13, scope: !132)
!144 = distinct !{!144, !134, !145, !70}
!145 = !DILocation(line: 74, column: 13, scope: !129)
!146 = !DILocation(line: 75, column: 31, scope: !126)
!147 = !DILocation(line: 75, column: 13, scope: !126)
!148 = !DILocation(line: 76, column: 18, scope: !126)
!149 = !DILocation(line: 76, column: 13, scope: !126)
!150 = !DILocation(line: 79, column: 1, scope: !101)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !19, line: 84, type: !4)
!153 = !DILocation(line: 84, column: 15, scope: !151)
!154 = !DILocation(line: 85, column: 10, scope: !151)
!155 = !DILocation(line: 86, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !19, line: 86, column: 8)
!157 = !DILocation(line: 86, column: 18, scope: !156)
!158 = !DILocation(line: 86, column: 8, scope: !151)
!159 = !DILocation(line: 89, column: 27, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !19, line: 87, column: 5)
!161 = !DILocation(line: 89, column: 16, scope: !160)
!162 = !DILocation(line: 89, column: 14, scope: !160)
!163 = !DILocation(line: 90, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !19, line: 90, column: 13)
!165 = !DILocation(line: 90, column: 18, scope: !164)
!166 = !DILocation(line: 90, column: 13, scope: !160)
!167 = !DILocation(line: 90, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !19, line: 90, column: 27)
!169 = !DILocation(line: 91, column: 5, scope: !160)
!170 = !DILocalVariable(name: "source", scope: !171, file: !19, line: 93, type: !42)
!171 = distinct !DILexicalBlock(scope: !151, file: !19, line: 92, column: 5)
!172 = !DILocation(line: 93, column: 17, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !174, file: !19, line: 95, type: !48)
!174 = distinct !DILexicalBlock(scope: !171, file: !19, line: 94, column: 9)
!175 = !DILocation(line: 95, column: 20, scope: !174)
!176 = !DILocation(line: 97, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !19, line: 97, column: 13)
!178 = !DILocation(line: 97, column: 18, scope: !177)
!179 = !DILocation(line: 97, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !19, line: 97, column: 13)
!181 = !DILocation(line: 97, column: 27, scope: !180)
!182 = !DILocation(line: 97, column: 13, scope: !177)
!183 = !DILocation(line: 99, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !19, line: 98, column: 13)
!185 = !DILocation(line: 99, column: 27, scope: !184)
!186 = !DILocation(line: 99, column: 17, scope: !184)
!187 = !DILocation(line: 99, column: 22, scope: !184)
!188 = !DILocation(line: 99, column: 25, scope: !184)
!189 = !DILocation(line: 100, column: 13, scope: !184)
!190 = !DILocation(line: 97, column: 35, scope: !180)
!191 = !DILocation(line: 97, column: 13, scope: !180)
!192 = distinct !{!192, !182, !193, !70}
!193 = !DILocation(line: 100, column: 13, scope: !177)
!194 = !DILocation(line: 101, column: 31, scope: !174)
!195 = !DILocation(line: 101, column: 13, scope: !174)
!196 = !DILocation(line: 102, column: 18, scope: !174)
!197 = !DILocation(line: 102, column: 13, scope: !174)
!198 = !DILocation(line: 105, column: 1, scope: !151)
