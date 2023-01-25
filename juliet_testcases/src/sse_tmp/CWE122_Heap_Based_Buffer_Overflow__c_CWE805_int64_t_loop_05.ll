; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_bad() #0 !dbg !25 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end2, !dbg !33

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %1 = bitcast i8* %call to i64*, !dbg !36
  store i64* %1, i64** %data, align 8, !dbg !37
  %2 = load i64*, i64** %data, align 8, !dbg !38
  %cmp = icmp eq i64* %2, null, !dbg !40
  br i1 %cmp, label %if.then1, label %if.end, !dbg !41

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !44

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !60
  %cmp3 = icmp ult i64 %4, 100, !dbg !62
  br i1 %cmp3, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !66
  %6 = load i64, i64* %arrayidx, align 8, !dbg !66
  %7 = load i64*, i64** %data, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !67
  store i64 %6, i64* %arrayidx4, align 8, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %9, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !76
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !76
  call void @printLongLongLine(i64 %11), !dbg !77
  %12 = load i64*, i64** %data, align 8, !dbg !78
  %13 = bitcast i64* %12 to i8*, !dbg !78
  call void @free(i8* %13) #6, !dbg !79
  ret void, !dbg !80
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i64* null, i64** %data, align 8, !dbg !108
  %0 = load i32, i32* @staticFalse, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end2, !dbg !114

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !115
  %1 = bitcast i8* %call to i64*, !dbg !117
  store i64* %1, i64** %data, align 8, !dbg !118
  %2 = load i64*, i64** %data, align 8, !dbg !119
  %cmp = icmp eq i64* %2, null, !dbg !121
  br i1 %cmp, label %if.then1, label %if.end, !dbg !122

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !134
  %cmp3 = icmp ult i64 %4, 100, !dbg !136
  br i1 %cmp3, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !140
  %6 = load i64, i64* %arrayidx, align 8, !dbg !140
  %7 = load i64*, i64** %data, align 8, !dbg !141
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !141
  store i64 %6, i64* %arrayidx4, align 8, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %9, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !149
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !149
  call void @printLongLongLine(i64 %11), !dbg !150
  %12 = load i64*, i64** %data, align 8, !dbg !151
  %13 = bitcast i64* %12 to i8*, !dbg !151
  call void @free(i8* %13) #6, !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i64* null, i64** %data, align 8, !dbg !157
  %0 = load i32, i32* @staticTrue, align 4, !dbg !158
  %tobool = icmp ne i32 %0, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end2, !dbg !160

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !161
  %1 = bitcast i8* %call to i64*, !dbg !163
  store i64* %1, i64** %data, align 8, !dbg !164
  %2 = load i64*, i64** %data, align 8, !dbg !165
  %cmp = icmp eq i64* %2, null, !dbg !167
  br i1 %cmp, label %if.then1, label %if.end, !dbg !168

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !171

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !172, metadata !DIExpression()), !dbg !174
  %3 = bitcast [100 x i64]* %source to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 800, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end2
  %4 = load i64, i64* %i, align 8, !dbg !181
  %cmp3 = icmp ult i64 %4, 100, !dbg !183
  br i1 %cmp3, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %5, !dbg !187
  %6 = load i64, i64* %arrayidx, align 8, !dbg !187
  %7 = load i64*, i64** %data, align 8, !dbg !188
  %8 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i64, i64* %7, i64 %8, !dbg !188
  store i64 %6, i64* %arrayidx4, align 8, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %9, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %10 = load i64*, i64** %data, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !196
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !196
  call void @printLongLongLine(i64 %11), !dbg !197
  %12 = load i64*, i64** %data, align 8, !dbg !198
  %13 = bitcast i64* %12 to i8*, !dbg !198
  call void @free(i8* %13) #6, !dbg !199
  ret void, !dbg !200
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
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 23, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 24, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_bad", scope: !17, file: !17, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !17, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 15, scope: !25)
!30 = !DILocation(line: 31, column: 10, scope: !25)
!31 = !DILocation(line: 32, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !17, line: 32, column: 8)
!33 = !DILocation(line: 32, column: 8, scope: !25)
!34 = !DILocation(line: 35, column: 27, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 16, scope: !35)
!37 = !DILocation(line: 35, column: 14, scope: !35)
!38 = !DILocation(line: 36, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !17, line: 36, column: 13)
!40 = !DILocation(line: 36, column: 18, scope: !39)
!41 = !DILocation(line: 36, column: 13, scope: !35)
!42 = !DILocation(line: 36, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 36, column: 27)
!44 = !DILocation(line: 37, column: 5, scope: !35)
!45 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !25, file: !17, line: 38, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 39, column: 17, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !17, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !17, line: 40, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 20, scope: !52)
!57 = !DILocation(line: 43, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !17, line: 43, column: 13)
!59 = !DILocation(line: 43, column: 18, scope: !58)
!60 = !DILocation(line: 43, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 43, column: 13)
!62 = !DILocation(line: 43, column: 27, scope: !61)
!63 = !DILocation(line: 43, column: 13, scope: !58)
!64 = !DILocation(line: 45, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 44, column: 13)
!66 = !DILocation(line: 45, column: 27, scope: !65)
!67 = !DILocation(line: 45, column: 17, scope: !65)
!68 = !DILocation(line: 45, column: 22, scope: !65)
!69 = !DILocation(line: 45, column: 25, scope: !65)
!70 = !DILocation(line: 46, column: 13, scope: !65)
!71 = !DILocation(line: 43, column: 35, scope: !61)
!72 = !DILocation(line: 43, column: 13, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 46, column: 13, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 47, column: 31, scope: !52)
!77 = !DILocation(line: 47, column: 13, scope: !52)
!78 = !DILocation(line: 48, column: 18, scope: !52)
!79 = !DILocation(line: 48, column: 13, scope: !52)
!80 = !DILocation(line: 51, column: 1, scope: !25)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_05_good", scope: !17, file: !17, line: 114, type: !26, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 116, column: 5, scope: !81)
!83 = !DILocation(line: 117, column: 5, scope: !81)
!84 = !DILocation(line: 118, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 130, type: !86, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!18, !18, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 130, type: !18)
!92 = !DILocation(line: 130, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 130, type: !88)
!94 = !DILocation(line: 130, column: 27, scope: !85)
!95 = !DILocation(line: 133, column: 22, scope: !85)
!96 = !DILocation(line: 133, column: 12, scope: !85)
!97 = !DILocation(line: 133, column: 5, scope: !85)
!98 = !DILocation(line: 135, column: 5, scope: !85)
!99 = !DILocation(line: 136, column: 5, scope: !85)
!100 = !DILocation(line: 137, column: 5, scope: !85)
!101 = !DILocation(line: 140, column: 5, scope: !85)
!102 = !DILocation(line: 141, column: 5, scope: !85)
!103 = !DILocation(line: 142, column: 5, scope: !85)
!104 = !DILocation(line: 144, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 60, type: !6)
!107 = !DILocation(line: 60, column: 15, scope: !105)
!108 = !DILocation(line: 61, column: 10, scope: !105)
!109 = !DILocation(line: 62, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 62, column: 8)
!111 = !DILocation(line: 62, column: 8, scope: !105)
!112 = !DILocation(line: 65, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !17, line: 63, column: 5)
!114 = !DILocation(line: 66, column: 5, scope: !113)
!115 = !DILocation(line: 70, column: 27, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !17, line: 68, column: 5)
!117 = !DILocation(line: 70, column: 16, scope: !116)
!118 = !DILocation(line: 70, column: 14, scope: !116)
!119 = !DILocation(line: 71, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !17, line: 71, column: 13)
!121 = !DILocation(line: 71, column: 18, scope: !120)
!122 = !DILocation(line: 71, column: 13, scope: !116)
!123 = !DILocation(line: 71, column: 28, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 71, column: 27)
!125 = !DILocalVariable(name: "source", scope: !126, file: !17, line: 74, type: !47)
!126 = distinct !DILexicalBlock(scope: !105, file: !17, line: 73, column: 5)
!127 = !DILocation(line: 74, column: 17, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !129, file: !17, line: 76, type: !53)
!129 = distinct !DILexicalBlock(scope: !126, file: !17, line: 75, column: 9)
!130 = !DILocation(line: 76, column: 20, scope: !129)
!131 = !DILocation(line: 78, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 78, column: 13)
!133 = !DILocation(line: 78, column: 18, scope: !132)
!134 = !DILocation(line: 78, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !17, line: 78, column: 13)
!136 = !DILocation(line: 78, column: 27, scope: !135)
!137 = !DILocation(line: 78, column: 13, scope: !132)
!138 = !DILocation(line: 80, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !17, line: 79, column: 13)
!140 = !DILocation(line: 80, column: 27, scope: !139)
!141 = !DILocation(line: 80, column: 17, scope: !139)
!142 = !DILocation(line: 80, column: 22, scope: !139)
!143 = !DILocation(line: 80, column: 25, scope: !139)
!144 = !DILocation(line: 81, column: 13, scope: !139)
!145 = !DILocation(line: 78, column: 35, scope: !135)
!146 = !DILocation(line: 78, column: 13, scope: !135)
!147 = distinct !{!147, !137, !148, !75}
!148 = !DILocation(line: 81, column: 13, scope: !132)
!149 = !DILocation(line: 82, column: 31, scope: !129)
!150 = !DILocation(line: 82, column: 13, scope: !129)
!151 = !DILocation(line: 83, column: 18, scope: !129)
!152 = !DILocation(line: 83, column: 13, scope: !129)
!153 = !DILocation(line: 86, column: 1, scope: !105)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 89, type: !26, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !17, line: 91, type: !6)
!156 = !DILocation(line: 91, column: 15, scope: !154)
!157 = !DILocation(line: 92, column: 10, scope: !154)
!158 = !DILocation(line: 93, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !17, line: 93, column: 8)
!160 = !DILocation(line: 93, column: 8, scope: !154)
!161 = !DILocation(line: 96, column: 27, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !17, line: 94, column: 5)
!163 = !DILocation(line: 96, column: 16, scope: !162)
!164 = !DILocation(line: 96, column: 14, scope: !162)
!165 = !DILocation(line: 97, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !17, line: 97, column: 13)
!167 = !DILocation(line: 97, column: 18, scope: !166)
!168 = !DILocation(line: 97, column: 13, scope: !162)
!169 = !DILocation(line: 97, column: 28, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !17, line: 97, column: 27)
!171 = !DILocation(line: 98, column: 5, scope: !162)
!172 = !DILocalVariable(name: "source", scope: !173, file: !17, line: 100, type: !47)
!173 = distinct !DILexicalBlock(scope: !154, file: !17, line: 99, column: 5)
!174 = !DILocation(line: 100, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !176, file: !17, line: 102, type: !53)
!176 = distinct !DILexicalBlock(scope: !173, file: !17, line: 101, column: 9)
!177 = !DILocation(line: 102, column: 20, scope: !176)
!178 = !DILocation(line: 104, column: 20, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !17, line: 104, column: 13)
!180 = !DILocation(line: 104, column: 18, scope: !179)
!181 = !DILocation(line: 104, column: 25, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !17, line: 104, column: 13)
!183 = !DILocation(line: 104, column: 27, scope: !182)
!184 = !DILocation(line: 104, column: 13, scope: !179)
!185 = !DILocation(line: 106, column: 34, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !17, line: 105, column: 13)
!187 = !DILocation(line: 106, column: 27, scope: !186)
!188 = !DILocation(line: 106, column: 17, scope: !186)
!189 = !DILocation(line: 106, column: 22, scope: !186)
!190 = !DILocation(line: 106, column: 25, scope: !186)
!191 = !DILocation(line: 107, column: 13, scope: !186)
!192 = !DILocation(line: 104, column: 35, scope: !182)
!193 = !DILocation(line: 104, column: 13, scope: !182)
!194 = distinct !{!194, !184, !195, !75}
!195 = !DILocation(line: 107, column: 13, scope: !179)
!196 = !DILocation(line: 108, column: 31, scope: !176)
!197 = !DILocation(line: 108, column: 13, scope: !176)
!198 = !DILocation(line: 109, column: 18, scope: !176)
!199 = !DILocation(line: 109, column: 13, scope: !176)
!200 = !DILocation(line: 112, column: 1, scope: !154)
