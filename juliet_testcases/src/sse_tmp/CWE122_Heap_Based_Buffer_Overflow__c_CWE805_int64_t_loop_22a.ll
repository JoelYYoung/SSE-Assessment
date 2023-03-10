; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badGlobal, align 4, !dbg !32
  %0 = load i64*, i64** %data, align 8, !dbg !33
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badSource(i64* %0), !dbg !34
  store i64* %call, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !57
  %4 = load i64, i64* %arrayidx, align 8, !dbg !57
  %5 = load i64*, i64** %data, align 8, !dbg !58
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !58
  store i64 %4, i64* %arrayidx1, align 8, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %7, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !67
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !67
  call void @printLongLongLine(i64 %9), !dbg !68
  %10 = load i64*, i64** %data, align 8, !dbg !69
  %11 = bitcast i64* %10 to i8*, !dbg !69
  call void @free(i8* %11) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badSource(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_good() #0 !dbg !72 {
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
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i64* null, i64** %data, align 8, !dbg !99
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Global, align 4, !dbg !100
  %0 = load i64*, i64** %data, align 8, !dbg !101
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Source(i64* %0), !dbg !102
  store i64* %call, i64** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %2, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !119
  %4 = load i64, i64* %arrayidx, align 8, !dbg !119
  %5 = load i64*, i64** %data, align 8, !dbg !120
  %6 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !120
  store i64 %4, i64* %arrayidx1, align 8, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %7, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !128
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !128
  call void @printLongLongLine(i64 %9), !dbg !129
  %10 = load i64*, i64** %data, align 8, !dbg !130
  %11 = bitcast i64* %10 to i8*, !dbg !130
  call void @free(i8* %11) #5, !dbg !131
  ret void, !dbg !132
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Source(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i64* null, i64** %data, align 8, !dbg !136
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Global, align 4, !dbg !137
  %0 = load i64*, i64** %data, align 8, !dbg !138
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Source(i64* %0), !dbg !139
  store i64* %call, i64** %data, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %2, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !156
  %4 = load i64, i64* %arrayidx, align 8, !dbg !156
  %5 = load i64*, i64** %data, align 8, !dbg !157
  %6 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !157
  store i64 %4, i64* %arrayidx1, align 8, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !165
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !165
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !165
  call void @printLongLongLine(i64 %9), !dbg !166
  %10 = load i64*, i64** %data, align 8, !dbg !167
  %11 = bitcast i64* %10 to i8*, !dbg !167
  call void @free(i8* %11) #5, !dbg !168
  ret void, !dbg !169
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Source(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B1Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_goodG2B2Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !26, line: 27, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !28, line: 44, baseType: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DILocation(line: 28, column: 15, scope: !20)
!31 = !DILocation(line: 29, column: 10, scope: !20)
!32 = !DILocation(line: 30, column: 75, scope: !20)
!33 = !DILocation(line: 31, column: 82, scope: !20)
!34 = !DILocation(line: 31, column: 12, scope: !20)
!35 = !DILocation(line: 31, column: 10, scope: !20)
!36 = !DILocalVariable(name: "source", scope: !37, file: !10, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !20, file: !10, line: 32, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !10, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 20, scope: !43)
!48 = !DILocation(line: 37, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !10, line: 37, column: 13)
!50 = !DILocation(line: 37, column: 18, scope: !49)
!51 = !DILocation(line: 37, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !10, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 27, scope: !52)
!54 = !DILocation(line: 37, column: 13, scope: !49)
!55 = !DILocation(line: 39, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !10, line: 38, column: 13)
!57 = !DILocation(line: 39, column: 27, scope: !56)
!58 = !DILocation(line: 39, column: 17, scope: !56)
!59 = !DILocation(line: 39, column: 22, scope: !56)
!60 = !DILocation(line: 39, column: 25, scope: !56)
!61 = !DILocation(line: 40, column: 13, scope: !56)
!62 = !DILocation(line: 37, column: 35, scope: !52)
!63 = !DILocation(line: 37, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 40, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 41, column: 31, scope: !43)
!68 = !DILocation(line: 41, column: 13, scope: !43)
!69 = !DILocation(line: 42, column: 18, scope: !43)
!70 = !DILocation(line: 42, column: 13, scope: !43)
!71 = !DILocation(line: 45, column: 1, scope: !20)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_22_good", scope: !10, file: !10, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 105, column: 5, scope: !72)
!74 = !DILocation(line: 106, column: 5, scope: !72)
!75 = !DILocation(line: 107, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 119, type: !77, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!11, !11, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !10, line: 119, type: !11)
!83 = !DILocation(line: 119, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !10, line: 119, type: !79)
!85 = !DILocation(line: 119, column: 27, scope: !76)
!86 = !DILocation(line: 122, column: 22, scope: !76)
!87 = !DILocation(line: 122, column: 12, scope: !76)
!88 = !DILocation(line: 122, column: 5, scope: !76)
!89 = !DILocation(line: 124, column: 5, scope: !76)
!90 = !DILocation(line: 125, column: 5, scope: !76)
!91 = !DILocation(line: 126, column: 5, scope: !76)
!92 = !DILocation(line: 129, column: 5, scope: !76)
!93 = !DILocation(line: 130, column: 5, scope: !76)
!94 = !DILocation(line: 131, column: 5, scope: !76)
!95 = !DILocation(line: 133, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 60, type: !24)
!98 = !DILocation(line: 60, column: 15, scope: !96)
!99 = !DILocation(line: 61, column: 10, scope: !96)
!100 = !DILocation(line: 62, column: 80, scope: !96)
!101 = !DILocation(line: 63, column: 87, scope: !96)
!102 = !DILocation(line: 63, column: 12, scope: !96)
!103 = !DILocation(line: 63, column: 10, scope: !96)
!104 = !DILocalVariable(name: "source", scope: !105, file: !10, line: 65, type: !38)
!105 = distinct !DILexicalBlock(scope: !96, file: !10, line: 64, column: 5)
!106 = !DILocation(line: 65, column: 17, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !108, file: !10, line: 67, type: !44)
!108 = distinct !DILexicalBlock(scope: !105, file: !10, line: 66, column: 9)
!109 = !DILocation(line: 67, column: 20, scope: !108)
!110 = !DILocation(line: 69, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !10, line: 69, column: 13)
!112 = !DILocation(line: 69, column: 18, scope: !111)
!113 = !DILocation(line: 69, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 69, column: 13)
!115 = !DILocation(line: 69, column: 27, scope: !114)
!116 = !DILocation(line: 69, column: 13, scope: !111)
!117 = !DILocation(line: 71, column: 34, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 70, column: 13)
!119 = !DILocation(line: 71, column: 27, scope: !118)
!120 = !DILocation(line: 71, column: 17, scope: !118)
!121 = !DILocation(line: 71, column: 22, scope: !118)
!122 = !DILocation(line: 71, column: 25, scope: !118)
!123 = !DILocation(line: 72, column: 13, scope: !118)
!124 = !DILocation(line: 69, column: 35, scope: !114)
!125 = !DILocation(line: 69, column: 13, scope: !114)
!126 = distinct !{!126, !116, !127, !66}
!127 = !DILocation(line: 72, column: 13, scope: !111)
!128 = !DILocation(line: 73, column: 31, scope: !108)
!129 = !DILocation(line: 73, column: 13, scope: !108)
!130 = !DILocation(line: 74, column: 18, scope: !108)
!131 = !DILocation(line: 74, column: 13, scope: !108)
!132 = !DILocation(line: 77, column: 1, scope: !96)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", scope: !133, file: !10, line: 84, type: !24)
!135 = !DILocation(line: 84, column: 15, scope: !133)
!136 = !DILocation(line: 85, column: 10, scope: !133)
!137 = !DILocation(line: 86, column: 80, scope: !133)
!138 = !DILocation(line: 87, column: 87, scope: !133)
!139 = !DILocation(line: 87, column: 12, scope: !133)
!140 = !DILocation(line: 87, column: 10, scope: !133)
!141 = !DILocalVariable(name: "source", scope: !142, file: !10, line: 89, type: !38)
!142 = distinct !DILexicalBlock(scope: !133, file: !10, line: 88, column: 5)
!143 = !DILocation(line: 89, column: 17, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !10, line: 91, type: !44)
!145 = distinct !DILexicalBlock(scope: !142, file: !10, line: 90, column: 9)
!146 = !DILocation(line: 91, column: 20, scope: !145)
!147 = !DILocation(line: 93, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !10, line: 93, column: 13)
!149 = !DILocation(line: 93, column: 18, scope: !148)
!150 = !DILocation(line: 93, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !10, line: 93, column: 13)
!152 = !DILocation(line: 93, column: 27, scope: !151)
!153 = !DILocation(line: 93, column: 13, scope: !148)
!154 = !DILocation(line: 95, column: 34, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !10, line: 94, column: 13)
!156 = !DILocation(line: 95, column: 27, scope: !155)
!157 = !DILocation(line: 95, column: 17, scope: !155)
!158 = !DILocation(line: 95, column: 22, scope: !155)
!159 = !DILocation(line: 95, column: 25, scope: !155)
!160 = !DILocation(line: 96, column: 13, scope: !155)
!161 = !DILocation(line: 93, column: 35, scope: !151)
!162 = !DILocation(line: 93, column: 13, scope: !151)
!163 = distinct !{!163, !153, !164, !66}
!164 = !DILocation(line: 96, column: 13, scope: !148)
!165 = !DILocation(line: 97, column: 31, scope: !145)
!166 = !DILocation(line: 97, column: 13, scope: !145)
!167 = !DILocation(line: 98, column: 18, scope: !145)
!168 = !DILocation(line: 98, column: 13, scope: !145)
!169 = !DILocation(line: 101, column: 1, scope: !133)
