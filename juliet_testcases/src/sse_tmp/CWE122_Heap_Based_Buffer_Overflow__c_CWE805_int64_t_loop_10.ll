; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @globalTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end2, !dbg !27

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %1 = bitcast i8* %call to i64*, !dbg !30
  store i64* %1, i64** %data, align 8, !dbg !31
  %2 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !38

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !54
  %cmp3 = icmp ult i64 %4, 100, !dbg !56
  br i1 %cmp3, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !60
  %6 = load i64, i64* %arrayidx, align 8, !dbg !60
  %7 = load i64*, i64** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !61
  store i64 %6, i64* %arrayidx4, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %9, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !70
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !70
  call void @printLongLongLine(i64 %11), !dbg !71
  %12 = load i64*, i64** %data, align 8, !dbg !72
  %13 = bitcast i64* %12 to i8*, !dbg !72
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

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_good() #0 !dbg !75 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_bad(), !dbg !97
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
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i64* null, i64** %data, align 8, !dbg !103
  %0 = load i32, i32* @globalFalse, align 4, !dbg !104
  %tobool = icmp ne i32 %0, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end2, !dbg !109

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !110
  %1 = bitcast i8* %call to i64*, !dbg !112
  store i64* %1, i64** %data, align 8, !dbg !113
  %2 = load i64*, i64** %data, align 8, !dbg !114
  %cmp = icmp eq i64* %2, null, !dbg !116
  br i1 %cmp, label %if.then1, label %if.end, !dbg !117

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp3 = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp3, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i64, i64* %arrayidx, align 8, !dbg !135
  %7 = load i64*, i64** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !136
  store i64 %6, i64* %arrayidx4, align 8, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !144
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !144
  call void @printLongLongLine(i64 %11), !dbg !145
  %12 = load i64*, i64** %data, align 8, !dbg !146
  %13 = bitcast i64* %12 to i8*, !dbg !146
  call void @free(i8* %13) #6, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i64* null, i64** %data, align 8, !dbg !152
  %0 = load i32, i32* @globalTrue, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end2, !dbg !155

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !156
  %1 = bitcast i8* %call to i64*, !dbg !158
  store i64* %1, i64** %data, align 8, !dbg !159
  %2 = load i64*, i64** %data, align 8, !dbg !160
  %cmp = icmp eq i64* %2, null, !dbg !162
  br i1 %cmp, label %if.then1, label %if.end, !dbg !163

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !166

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !176
  %cmp3 = icmp ult i64 %4, 100, !dbg !178
  br i1 %cmp3, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !182
  %6 = load i64, i64* %arrayidx, align 8, !dbg !182
  %7 = load i64*, i64** %data, align 8, !dbg !183
  %8 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !183
  store i64 %6, i64* %arrayidx4, align 8, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %9, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !191
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !191
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !191
  call void @printLongLongLine(i64 %11), !dbg !192
  %12 = load i64*, i64** %data, align 8, !dbg !193
  %13 = bitcast i64* %12 to i8*, !dbg !193
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 25, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 8)
!27 = !DILocation(line: 25, column: 8, scope: !18)
!28 = !DILocation(line: 28, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 26, column: 5)
!30 = !DILocation(line: 28, column: 16, scope: !29)
!31 = !DILocation(line: 28, column: 14, scope: !29)
!32 = !DILocation(line: 29, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 29, column: 13)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 13, scope: !29)
!36 = !DILocation(line: 29, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 29, column: 27)
!38 = !DILocation(line: 30, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !19, line: 32, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 32, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !19, line: 34, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !19, line: 33, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 34, column: 20, scope: !46)
!51 = !DILocation(line: 36, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !19, line: 36, column: 13)
!53 = !DILocation(line: 36, column: 18, scope: !52)
!54 = !DILocation(line: 36, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !19, line: 36, column: 13)
!56 = !DILocation(line: 36, column: 27, scope: !55)
!57 = !DILocation(line: 36, column: 13, scope: !52)
!58 = !DILocation(line: 38, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !19, line: 37, column: 13)
!60 = !DILocation(line: 38, column: 27, scope: !59)
!61 = !DILocation(line: 38, column: 17, scope: !59)
!62 = !DILocation(line: 38, column: 22, scope: !59)
!63 = !DILocation(line: 38, column: 25, scope: !59)
!64 = !DILocation(line: 39, column: 13, scope: !59)
!65 = !DILocation(line: 36, column: 35, scope: !55)
!66 = !DILocation(line: 36, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 39, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 40, column: 31, scope: !46)
!71 = !DILocation(line: 40, column: 13, scope: !46)
!72 = !DILocation(line: 41, column: 18, scope: !46)
!73 = !DILocation(line: 41, column: 13, scope: !46)
!74 = !DILocation(line: 44, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_10_good", scope: !19, file: !19, line: 107, type: !20, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 109, column: 5, scope: !75)
!77 = !DILocation(line: 110, column: 5, scope: !75)
!78 = !DILocation(line: 111, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 123, type: !80, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !19, line: 123, type: !82)
!87 = !DILocation(line: 123, column: 14, scope: !79)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !19, line: 123, type: !83)
!89 = !DILocation(line: 123, column: 27, scope: !79)
!90 = !DILocation(line: 126, column: 22, scope: !79)
!91 = !DILocation(line: 126, column: 12, scope: !79)
!92 = !DILocation(line: 126, column: 5, scope: !79)
!93 = !DILocation(line: 128, column: 5, scope: !79)
!94 = !DILocation(line: 129, column: 5, scope: !79)
!95 = !DILocation(line: 130, column: 5, scope: !79)
!96 = !DILocation(line: 133, column: 5, scope: !79)
!97 = !DILocation(line: 134, column: 5, scope: !79)
!98 = !DILocation(line: 135, column: 5, scope: !79)
!99 = !DILocation(line: 137, column: 5, scope: !79)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !19, line: 53, type: !4)
!102 = !DILocation(line: 53, column: 15, scope: !100)
!103 = !DILocation(line: 54, column: 10, scope: !100)
!104 = !DILocation(line: 55, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !19, line: 55, column: 8)
!106 = !DILocation(line: 55, column: 8, scope: !100)
!107 = !DILocation(line: 58, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !19, line: 56, column: 5)
!109 = !DILocation(line: 59, column: 5, scope: !108)
!110 = !DILocation(line: 63, column: 27, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !19, line: 61, column: 5)
!112 = !DILocation(line: 63, column: 16, scope: !111)
!113 = !DILocation(line: 63, column: 14, scope: !111)
!114 = !DILocation(line: 64, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !19, line: 64, column: 13)
!116 = !DILocation(line: 64, column: 18, scope: !115)
!117 = !DILocation(line: 64, column: 13, scope: !111)
!118 = !DILocation(line: 64, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 64, column: 27)
!120 = !DILocalVariable(name: "source", scope: !121, file: !19, line: 67, type: !41)
!121 = distinct !DILexicalBlock(scope: !100, file: !19, line: 66, column: 5)
!122 = !DILocation(line: 67, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !19, line: 69, type: !47)
!124 = distinct !DILexicalBlock(scope: !121, file: !19, line: 68, column: 9)
!125 = !DILocation(line: 69, column: 20, scope: !124)
!126 = !DILocation(line: 71, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !19, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 18, scope: !127)
!129 = !DILocation(line: 71, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !19, line: 71, column: 13)
!131 = !DILocation(line: 71, column: 27, scope: !130)
!132 = !DILocation(line: 71, column: 13, scope: !127)
!133 = !DILocation(line: 73, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !19, line: 72, column: 13)
!135 = !DILocation(line: 73, column: 27, scope: !134)
!136 = !DILocation(line: 73, column: 17, scope: !134)
!137 = !DILocation(line: 73, column: 22, scope: !134)
!138 = !DILocation(line: 73, column: 25, scope: !134)
!139 = !DILocation(line: 74, column: 13, scope: !134)
!140 = !DILocation(line: 71, column: 35, scope: !130)
!141 = !DILocation(line: 71, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !69}
!143 = !DILocation(line: 74, column: 13, scope: !127)
!144 = !DILocation(line: 75, column: 31, scope: !124)
!145 = !DILocation(line: 75, column: 13, scope: !124)
!146 = !DILocation(line: 76, column: 18, scope: !124)
!147 = !DILocation(line: 76, column: 13, scope: !124)
!148 = !DILocation(line: 79, column: 1, scope: !100)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !19, line: 84, type: !4)
!151 = !DILocation(line: 84, column: 15, scope: !149)
!152 = !DILocation(line: 85, column: 10, scope: !149)
!153 = !DILocation(line: 86, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !19, line: 86, column: 8)
!155 = !DILocation(line: 86, column: 8, scope: !149)
!156 = !DILocation(line: 89, column: 27, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !19, line: 87, column: 5)
!158 = !DILocation(line: 89, column: 16, scope: !157)
!159 = !DILocation(line: 89, column: 14, scope: !157)
!160 = !DILocation(line: 90, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !19, line: 90, column: 13)
!162 = !DILocation(line: 90, column: 18, scope: !161)
!163 = !DILocation(line: 90, column: 13, scope: !157)
!164 = !DILocation(line: 90, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !19, line: 90, column: 27)
!166 = !DILocation(line: 91, column: 5, scope: !157)
!167 = !DILocalVariable(name: "source", scope: !168, file: !19, line: 93, type: !41)
!168 = distinct !DILexicalBlock(scope: !149, file: !19, line: 92, column: 5)
!169 = !DILocation(line: 93, column: 17, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !171, file: !19, line: 95, type: !47)
!171 = distinct !DILexicalBlock(scope: !168, file: !19, line: 94, column: 9)
!172 = !DILocation(line: 95, column: 20, scope: !171)
!173 = !DILocation(line: 97, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !19, line: 97, column: 13)
!175 = !DILocation(line: 97, column: 18, scope: !174)
!176 = !DILocation(line: 97, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !19, line: 97, column: 13)
!178 = !DILocation(line: 97, column: 27, scope: !177)
!179 = !DILocation(line: 97, column: 13, scope: !174)
!180 = !DILocation(line: 99, column: 34, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !19, line: 98, column: 13)
!182 = !DILocation(line: 99, column: 27, scope: !181)
!183 = !DILocation(line: 99, column: 17, scope: !181)
!184 = !DILocation(line: 99, column: 22, scope: !181)
!185 = !DILocation(line: 99, column: 25, scope: !181)
!186 = !DILocation(line: 100, column: 13, scope: !181)
!187 = !DILocation(line: 97, column: 35, scope: !177)
!188 = !DILocation(line: 97, column: 13, scope: !177)
!189 = distinct !{!189, !179, !190, !69}
!190 = !DILocation(line: 100, column: 13, scope: !174)
!191 = !DILocation(line: 101, column: 31, scope: !171)
!192 = !DILocation(line: 101, column: 13, scope: !171)
!193 = !DILocation(line: 102, column: 18, scope: !171)
!194 = !DILocation(line: 102, column: 13, scope: !171)
!195 = !DILocation(line: 105, column: 1, scope: !149)
