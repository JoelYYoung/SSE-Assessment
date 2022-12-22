; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end3, !dbg !27

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call1 to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !54
  %cmp4 = icmp ult i64 %3, 100, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i64, i64* %arrayidx, align 8, !dbg !60
  %6 = load i64*, i64** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !61
  store i64 %5, i64* %arrayidx5, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !70
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !70
  call void @printLongLongLine(i64 %10), !dbg !71
  %11 = load i64*, i64** %data, align 8, !dbg !72
  %12 = bitcast i64* %11 to i8*, !dbg !72
  call void @free(i8* %12) #6, !dbg !73
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_good() #0 !dbg !75 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !100 {
entry:
  ret i32 1, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i64* null, i64** %data, align 8, !dbg !107
  %call = call i32 @staticReturnsFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end3, !dbg !113

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !114
  %0 = bitcast i8* %call1 to i64*, !dbg !116
  store i64* %0, i64** %data, align 8, !dbg !117
  %1 = load i64*, i64** %data, align 8, !dbg !118
  %cmp = icmp eq i64* %1, null, !dbg !120
  br i1 %cmp, label %if.then2, label %if.end, !dbg !121

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !133
  %cmp4 = icmp ult i64 %3, 100, !dbg !135
  br i1 %cmp4, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !139
  %5 = load i64, i64* %arrayidx, align 8, !dbg !139
  %6 = load i64*, i64** %data, align 8, !dbg !140
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !140
  store i64 %5, i64* %arrayidx5, align 8, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %8, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !148
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !148
  call void @printLongLongLine(i64 %10), !dbg !149
  %11 = load i64*, i64** %data, align 8, !dbg !150
  %12 = bitcast i64* %11 to i8*, !dbg !150
  call void @free(i8* %12) #6, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !153 {
entry:
  ret i32 0, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !156, metadata !DIExpression()), !dbg !157
  store i64* null, i64** %data, align 8, !dbg !158
  %call = call i32 @staticReturnsTrue(), !dbg !159
  %tobool = icmp ne i32 %call, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end3, !dbg !161

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !162
  %0 = bitcast i8* %call1 to i64*, !dbg !164
  store i64* %0, i64** %data, align 8, !dbg !165
  %1 = load i64*, i64** %data, align 8, !dbg !166
  %cmp = icmp eq i64* %1, null, !dbg !168
  br i1 %cmp, label %if.then2, label %if.end, !dbg !169

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !170
  unreachable, !dbg !170

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !172

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !182
  %cmp4 = icmp ult i64 %3, 100, !dbg !184
  br i1 %cmp4, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !188
  %5 = load i64, i64* %arrayidx, align 8, !dbg !188
  %6 = load i64*, i64** %data, align 8, !dbg !189
  %7 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx5 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !189
  store i64 %5, i64* %arrayidx5, align 8, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %8, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !197
  %arrayidx6 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !197
  %10 = load i64, i64* %arrayidx6, align 8, !dbg !197
  call void @printLongLongLine(i64 %10), !dbg !198
  %11 = load i64*, i64** %data, align 8, !dbg !199
  %12 = bitcast i64* %11 to i8*, !dbg !199
  call void @free(i8* %12) #6, !dbg !200
  ret void, !dbg !201
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_bad", scope: !19, file: !19, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 37, type: !4)
!23 = !DILocation(line: 37, column: 15, scope: !18)
!24 = !DILocation(line: 38, column: 10, scope: !18)
!25 = !DILocation(line: 39, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 39, column: 8)
!27 = !DILocation(line: 39, column: 8, scope: !18)
!28 = !DILocation(line: 42, column: 27, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 40, column: 5)
!30 = !DILocation(line: 42, column: 16, scope: !29)
!31 = !DILocation(line: 42, column: 14, scope: !29)
!32 = !DILocation(line: 43, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 43, column: 13)
!34 = !DILocation(line: 43, column: 18, scope: !33)
!35 = !DILocation(line: 43, column: 13, scope: !29)
!36 = !DILocation(line: 43, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 43, column: 27)
!38 = !DILocation(line: 44, column: 5, scope: !29)
!39 = !DILocalVariable(name: "source", scope: !40, file: !19, line: 46, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 45, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 46, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !19, line: 48, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !19, line: 47, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 48, column: 20, scope: !46)
!51 = !DILocation(line: 50, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !19, line: 50, column: 13)
!53 = !DILocation(line: 50, column: 18, scope: !52)
!54 = !DILocation(line: 50, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !19, line: 50, column: 13)
!56 = !DILocation(line: 50, column: 27, scope: !55)
!57 = !DILocation(line: 50, column: 13, scope: !52)
!58 = !DILocation(line: 52, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !19, line: 51, column: 13)
!60 = !DILocation(line: 52, column: 27, scope: !59)
!61 = !DILocation(line: 52, column: 17, scope: !59)
!62 = !DILocation(line: 52, column: 22, scope: !59)
!63 = !DILocation(line: 52, column: 25, scope: !59)
!64 = !DILocation(line: 53, column: 13, scope: !59)
!65 = !DILocation(line: 50, column: 35, scope: !55)
!66 = !DILocation(line: 50, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 53, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 54, column: 31, scope: !46)
!71 = !DILocation(line: 54, column: 13, scope: !46)
!72 = !DILocation(line: 55, column: 18, scope: !46)
!73 = !DILocation(line: 55, column: 13, scope: !46)
!74 = !DILocation(line: 58, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_08_good", scope: !19, file: !19, line: 121, type: !20, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 123, column: 5, scope: !75)
!77 = !DILocation(line: 124, column: 5, scope: !75)
!78 = !DILocation(line: 125, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 137, type: !80, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !19, line: 137, type: !82)
!87 = !DILocation(line: 137, column: 14, scope: !79)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !19, line: 137, type: !83)
!89 = !DILocation(line: 137, column: 27, scope: !79)
!90 = !DILocation(line: 140, column: 22, scope: !79)
!91 = !DILocation(line: 140, column: 12, scope: !79)
!92 = !DILocation(line: 140, column: 5, scope: !79)
!93 = !DILocation(line: 142, column: 5, scope: !79)
!94 = !DILocation(line: 143, column: 5, scope: !79)
!95 = !DILocation(line: 144, column: 5, scope: !79)
!96 = !DILocation(line: 147, column: 5, scope: !79)
!97 = !DILocation(line: 148, column: 5, scope: !79)
!98 = !DILocation(line: 149, column: 5, scope: !79)
!99 = !DILocation(line: 151, column: 5, scope: !79)
!100 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 23, type: !101, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!82}
!103 = !DILocation(line: 25, column: 5, scope: !100)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 67, type: !4)
!106 = !DILocation(line: 67, column: 15, scope: !104)
!107 = !DILocation(line: 68, column: 10, scope: !104)
!108 = !DILocation(line: 69, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !19, line: 69, column: 8)
!110 = !DILocation(line: 69, column: 8, scope: !104)
!111 = !DILocation(line: 72, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !19, line: 70, column: 5)
!113 = !DILocation(line: 73, column: 5, scope: !112)
!114 = !DILocation(line: 77, column: 27, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !19, line: 75, column: 5)
!116 = !DILocation(line: 77, column: 16, scope: !115)
!117 = !DILocation(line: 77, column: 14, scope: !115)
!118 = !DILocation(line: 78, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 78, column: 13)
!120 = !DILocation(line: 78, column: 18, scope: !119)
!121 = !DILocation(line: 78, column: 13, scope: !115)
!122 = !DILocation(line: 78, column: 28, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !19, line: 78, column: 27)
!124 = !DILocalVariable(name: "source", scope: !125, file: !19, line: 81, type: !41)
!125 = distinct !DILexicalBlock(scope: !104, file: !19, line: 80, column: 5)
!126 = !DILocation(line: 81, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !128, file: !19, line: 83, type: !47)
!128 = distinct !DILexicalBlock(scope: !125, file: !19, line: 82, column: 9)
!129 = !DILocation(line: 83, column: 20, scope: !128)
!130 = !DILocation(line: 85, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !19, line: 85, column: 13)
!132 = !DILocation(line: 85, column: 18, scope: !131)
!133 = !DILocation(line: 85, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !19, line: 85, column: 13)
!135 = !DILocation(line: 85, column: 27, scope: !134)
!136 = !DILocation(line: 85, column: 13, scope: !131)
!137 = !DILocation(line: 87, column: 34, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !19, line: 86, column: 13)
!139 = !DILocation(line: 87, column: 27, scope: !138)
!140 = !DILocation(line: 87, column: 17, scope: !138)
!141 = !DILocation(line: 87, column: 22, scope: !138)
!142 = !DILocation(line: 87, column: 25, scope: !138)
!143 = !DILocation(line: 88, column: 13, scope: !138)
!144 = !DILocation(line: 85, column: 35, scope: !134)
!145 = !DILocation(line: 85, column: 13, scope: !134)
!146 = distinct !{!146, !136, !147, !69}
!147 = !DILocation(line: 88, column: 13, scope: !131)
!148 = !DILocation(line: 89, column: 31, scope: !128)
!149 = !DILocation(line: 89, column: 13, scope: !128)
!150 = !DILocation(line: 90, column: 18, scope: !128)
!151 = !DILocation(line: 90, column: 13, scope: !128)
!152 = !DILocation(line: 93, column: 1, scope: !104)
!153 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 28, type: !101, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocation(line: 30, column: 5, scope: !153)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 96, type: !20, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !19, line: 98, type: !4)
!157 = !DILocation(line: 98, column: 15, scope: !155)
!158 = !DILocation(line: 99, column: 10, scope: !155)
!159 = !DILocation(line: 100, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !19, line: 100, column: 8)
!161 = !DILocation(line: 100, column: 8, scope: !155)
!162 = !DILocation(line: 103, column: 27, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !19, line: 101, column: 5)
!164 = !DILocation(line: 103, column: 16, scope: !163)
!165 = !DILocation(line: 103, column: 14, scope: !163)
!166 = !DILocation(line: 104, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !19, line: 104, column: 13)
!168 = !DILocation(line: 104, column: 18, scope: !167)
!169 = !DILocation(line: 104, column: 13, scope: !163)
!170 = !DILocation(line: 104, column: 28, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !19, line: 104, column: 27)
!172 = !DILocation(line: 105, column: 5, scope: !163)
!173 = !DILocalVariable(name: "source", scope: !174, file: !19, line: 107, type: !41)
!174 = distinct !DILexicalBlock(scope: !155, file: !19, line: 106, column: 5)
!175 = !DILocation(line: 107, column: 17, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !177, file: !19, line: 109, type: !47)
!177 = distinct !DILexicalBlock(scope: !174, file: !19, line: 108, column: 9)
!178 = !DILocation(line: 109, column: 20, scope: !177)
!179 = !DILocation(line: 111, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !19, line: 111, column: 13)
!181 = !DILocation(line: 111, column: 18, scope: !180)
!182 = !DILocation(line: 111, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !19, line: 111, column: 13)
!184 = !DILocation(line: 111, column: 27, scope: !183)
!185 = !DILocation(line: 111, column: 13, scope: !180)
!186 = !DILocation(line: 113, column: 34, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !19, line: 112, column: 13)
!188 = !DILocation(line: 113, column: 27, scope: !187)
!189 = !DILocation(line: 113, column: 17, scope: !187)
!190 = !DILocation(line: 113, column: 22, scope: !187)
!191 = !DILocation(line: 113, column: 25, scope: !187)
!192 = !DILocation(line: 114, column: 13, scope: !187)
!193 = !DILocation(line: 111, column: 35, scope: !183)
!194 = !DILocation(line: 111, column: 13, scope: !183)
!195 = distinct !{!195, !185, !196, !69}
!196 = !DILocation(line: 114, column: 13, scope: !180)
!197 = !DILocation(line: 115, column: 31, scope: !177)
!198 = !DILocation(line: 115, column: 13, scope: !177)
!199 = !DILocation(line: 116, column: 18, scope: !177)
!200 = !DILocation(line: 116, column: 13, scope: !177)
!201 = !DILocation(line: 119, column: 1, scope: !155)
