; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !55
  %4 = load i8*, i8** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !56
  store i8 %3, i8* %arrayidx2, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !65
  store i8 0, i8* %arrayidx3, align 1, !dbg !66
  %8 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %8), !dbg !68
  %9 = load i8*, i8** %data, align 8, !dbg !69
  call void @free(i8* %9) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_good() #0 !dbg !72 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Global, align 4, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Source(i8* %0), !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %1, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !119
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !120
  store i8 %3, i8* %arrayidx2, align 1, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %6, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !128
  store i8 0, i8* %arrayidx3, align 1, !dbg !129
  %8 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %8), !dbg !131
  %9 = load i8*, i8** %data, align 8, !dbg !132
  call void @free(i8* %9) #5, !dbg !133
  ret void, !dbg !134
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i8* null, i8** %data, align 8, !dbg !138
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Global, align 4, !dbg !139
  %0 = load i8*, i8** %data, align 8, !dbg !140
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Source(i8* %0), !dbg !141
  store i8* %call, i8** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !154
  %cmp = icmp ult i64 %1, 100, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !160
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !160
  %4 = load i8*, i8** %data, align 8, !dbg !161
  %5 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !161
  store i8 %3, i8* %arrayidx2, align 1, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %6, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !169
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !169
  store i8 0, i8* %arrayidx3, align 1, !dbg !170
  %8 = load i8*, i8** %data, align 8, !dbg !171
  call void @printLine(i8* %8), !dbg !172
  %9 = load i8*, i8** %data, align 8, !dbg !173
  call void @free(i8* %9) #5, !dbg !174
  ret void, !dbg !175
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Source(i8*) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B1Global", scope: !2, file: !10, line: 55, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_goodG2B2Global", scope: !2, file: !10, line: 56, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 72, scope: !20)
!29 = !DILocation(line: 33, column: 79, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 35, column: 16, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 36, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 14, scope: !33)
!43 = !DILocation(line: 37, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 9, scope: !33)
!45 = !DILocation(line: 38, column: 23, scope: !33)
!46 = !DILocation(line: 40, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !33, file: !10, line: 40, column: 9)
!48 = !DILocation(line: 40, column: 14, scope: !47)
!49 = !DILocation(line: 40, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !10, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 23, scope: !50)
!52 = !DILocation(line: 40, column: 9, scope: !47)
!53 = !DILocation(line: 42, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !10, line: 41, column: 9)
!55 = !DILocation(line: 42, column: 23, scope: !54)
!56 = !DILocation(line: 42, column: 13, scope: !54)
!57 = !DILocation(line: 42, column: 18, scope: !54)
!58 = !DILocation(line: 42, column: 21, scope: !54)
!59 = !DILocation(line: 43, column: 9, scope: !54)
!60 = !DILocation(line: 40, column: 31, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 43, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 44, column: 9, scope: !33)
!66 = !DILocation(line: 44, column: 21, scope: !33)
!67 = !DILocation(line: 45, column: 19, scope: !33)
!68 = !DILocation(line: 45, column: 9, scope: !33)
!69 = !DILocation(line: 46, column: 14, scope: !33)
!70 = !DILocation(line: 46, column: 9, scope: !33)
!71 = !DILocation(line: 48, column: 1, scope: !20)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_22_good", scope: !10, file: !10, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 110, column: 5, scope: !72)
!74 = !DILocation(line: 111, column: 5, scope: !72)
!75 = !DILocation(line: 112, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !77, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DISubroutineType(types: !78)
!78 = !{!11, !11, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !10, line: 124, type: !11)
!81 = !DILocation(line: 124, column: 14, scope: !76)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !10, line: 124, type: !79)
!83 = !DILocation(line: 124, column: 27, scope: !76)
!84 = !DILocation(line: 127, column: 22, scope: !76)
!85 = !DILocation(line: 127, column: 12, scope: !76)
!86 = !DILocation(line: 127, column: 5, scope: !76)
!87 = !DILocation(line: 129, column: 5, scope: !76)
!88 = !DILocation(line: 130, column: 5, scope: !76)
!89 = !DILocation(line: 131, column: 5, scope: !76)
!90 = !DILocation(line: 134, column: 5, scope: !76)
!91 = !DILocation(line: 135, column: 5, scope: !76)
!92 = !DILocation(line: 136, column: 5, scope: !76)
!93 = !DILocation(line: 138, column: 5, scope: !76)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !10, line: 63, type: !24)
!96 = !DILocation(line: 63, column: 12, scope: !94)
!97 = !DILocation(line: 64, column: 10, scope: !94)
!98 = !DILocation(line: 65, column: 77, scope: !94)
!99 = !DILocation(line: 66, column: 84, scope: !94)
!100 = !DILocation(line: 66, column: 12, scope: !94)
!101 = !DILocation(line: 66, column: 10, scope: !94)
!102 = !DILocalVariable(name: "i", scope: !103, file: !10, line: 68, type: !34)
!103 = distinct !DILexicalBlock(scope: !94, file: !10, line: 67, column: 5)
!104 = !DILocation(line: 68, column: 16, scope: !103)
!105 = !DILocalVariable(name: "source", scope: !103, file: !10, line: 69, type: !39)
!106 = !DILocation(line: 69, column: 14, scope: !103)
!107 = !DILocation(line: 70, column: 9, scope: !103)
!108 = !DILocation(line: 71, column: 9, scope: !103)
!109 = !DILocation(line: 71, column: 23, scope: !103)
!110 = !DILocation(line: 73, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !10, line: 73, column: 9)
!112 = !DILocation(line: 73, column: 14, scope: !111)
!113 = !DILocation(line: 73, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 73, column: 9)
!115 = !DILocation(line: 73, column: 23, scope: !114)
!116 = !DILocation(line: 73, column: 9, scope: !111)
!117 = !DILocation(line: 75, column: 30, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !10, line: 74, column: 9)
!119 = !DILocation(line: 75, column: 23, scope: !118)
!120 = !DILocation(line: 75, column: 13, scope: !118)
!121 = !DILocation(line: 75, column: 18, scope: !118)
!122 = !DILocation(line: 75, column: 21, scope: !118)
!123 = !DILocation(line: 76, column: 9, scope: !118)
!124 = !DILocation(line: 73, column: 31, scope: !114)
!125 = !DILocation(line: 73, column: 9, scope: !114)
!126 = distinct !{!126, !116, !127, !64}
!127 = !DILocation(line: 76, column: 9, scope: !111)
!128 = !DILocation(line: 77, column: 9, scope: !103)
!129 = !DILocation(line: 77, column: 21, scope: !103)
!130 = !DILocation(line: 78, column: 19, scope: !103)
!131 = !DILocation(line: 78, column: 9, scope: !103)
!132 = !DILocation(line: 79, column: 14, scope: !103)
!133 = !DILocation(line: 79, column: 9, scope: !103)
!134 = !DILocation(line: 81, column: 1, scope: !94)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !10, line: 88, type: !24)
!137 = !DILocation(line: 88, column: 12, scope: !135)
!138 = !DILocation(line: 89, column: 10, scope: !135)
!139 = !DILocation(line: 90, column: 77, scope: !135)
!140 = !DILocation(line: 91, column: 84, scope: !135)
!141 = !DILocation(line: 91, column: 12, scope: !135)
!142 = !DILocation(line: 91, column: 10, scope: !135)
!143 = !DILocalVariable(name: "i", scope: !144, file: !10, line: 93, type: !34)
!144 = distinct !DILexicalBlock(scope: !135, file: !10, line: 92, column: 5)
!145 = !DILocation(line: 93, column: 16, scope: !144)
!146 = !DILocalVariable(name: "source", scope: !144, file: !10, line: 94, type: !39)
!147 = !DILocation(line: 94, column: 14, scope: !144)
!148 = !DILocation(line: 95, column: 9, scope: !144)
!149 = !DILocation(line: 96, column: 9, scope: !144)
!150 = !DILocation(line: 96, column: 23, scope: !144)
!151 = !DILocation(line: 98, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !144, file: !10, line: 98, column: 9)
!153 = !DILocation(line: 98, column: 14, scope: !152)
!154 = !DILocation(line: 98, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !10, line: 98, column: 9)
!156 = !DILocation(line: 98, column: 23, scope: !155)
!157 = !DILocation(line: 98, column: 9, scope: !152)
!158 = !DILocation(line: 100, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !10, line: 99, column: 9)
!160 = !DILocation(line: 100, column: 23, scope: !159)
!161 = !DILocation(line: 100, column: 13, scope: !159)
!162 = !DILocation(line: 100, column: 18, scope: !159)
!163 = !DILocation(line: 100, column: 21, scope: !159)
!164 = !DILocation(line: 101, column: 9, scope: !159)
!165 = !DILocation(line: 98, column: 31, scope: !155)
!166 = !DILocation(line: 98, column: 9, scope: !155)
!167 = distinct !{!167, !157, !168, !64}
!168 = !DILocation(line: 101, column: 9, scope: !152)
!169 = !DILocation(line: 102, column: 9, scope: !144)
!170 = !DILocation(line: 102, column: 21, scope: !144)
!171 = !DILocation(line: 103, column: 19, scope: !144)
!172 = !DILocation(line: 103, column: 9, scope: !144)
!173 = !DILocation(line: 104, column: 14, scope: !144)
!174 = !DILocation(line: 104, column: 9, scope: !144)
!175 = !DILocation(line: 106, column: 1, scope: !135)
