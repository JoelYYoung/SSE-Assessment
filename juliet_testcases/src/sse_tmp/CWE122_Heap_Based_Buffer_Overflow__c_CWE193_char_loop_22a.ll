; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !45
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !46
  store i64 %call1, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %3 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %3, 1, !dbg !54
  %cmp = icmp ult i64 %2, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i8, i8* %arrayidx, align 1, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !60
  store i8 %5, i8* %arrayidx2, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %9), !dbg !70
  %10 = load i8*, i8** %data, align 8, !dbg !71
  call void @free(i8* %10) #7, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Global, align 4, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Source(i8* %0), !dbg !102
  store i8* %call, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !112
  store i64 %call1, i64* %sourceLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !117
  %3 = load i64, i64* %sourceLen, align 8, !dbg !119
  %add = add i64 %3, 1, !dbg !120
  %cmp = icmp ult i64 %2, %add, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !125
  %5 = load i8, i8* %arrayidx, align 1, !dbg !125
  %6 = load i8*, i8** %data, align 8, !dbg !126
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !126
  store i8 %5, i8* %arrayidx2, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %8, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %9), !dbg !135
  %10 = load i8*, i8** %data, align 8, !dbg !136
  call void @free(i8* %10) #7, !dbg !137
  ret void, !dbg !138
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i8* null, i8** %data, align 8, !dbg !142
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Global, align 4, !dbg !143
  %0 = load i8*, i8** %data, align 8, !dbg !144
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Source(i8* %0), !dbg !145
  store i8* %call, i8** %data, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !152, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !154
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !155
  store i64 %call1, i64* %sourceLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !160
  %3 = load i64, i64* %sourceLen, align 8, !dbg !162
  %add = add i64 %3, 1, !dbg !163
  %cmp = icmp ult i64 %2, %add, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !168
  %5 = load i8, i8* %arrayidx, align 1, !dbg !168
  %6 = load i8*, i8** %data, align 8, !dbg !169
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !169
  store i8 %5, i8* %arrayidx2, align 1, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %8, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !177
  call void @printLine(i8* %9), !dbg !178
  %10 = load i8*, i8** %data, align 8, !dbg !179
  call void @free(i8* %10) #7, !dbg !180
  ret void, !dbg !181
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_badGlobal", scope: !2, file: !10, line: 29, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B1Global", scope: !2, file: !10, line: 59, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_goodG2B2Global", scope: !2, file: !10, line: 60, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_bad", scope: !10, file: !10, line: 33, type: !21, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 35, column: 12, scope: !20)
!27 = !DILocation(line: 36, column: 10, scope: !20)
!28 = !DILocation(line: 37, column: 72, scope: !20)
!29 = !DILocation(line: 38, column: 79, scope: !20)
!30 = !DILocation(line: 38, column: 12, scope: !20)
!31 = !DILocation(line: 38, column: 10, scope: !20)
!32 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 40, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !10, line: 41, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 41, column: 16, scope: !33)
!43 = !DILocalVariable(name: "sourceLen", scope: !33, file: !10, line: 41, type: !39)
!44 = !DILocation(line: 41, column: 19, scope: !33)
!45 = !DILocation(line: 42, column: 28, scope: !33)
!46 = !DILocation(line: 42, column: 21, scope: !33)
!47 = !DILocation(line: 42, column: 19, scope: !33)
!48 = !DILocation(line: 45, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !10, line: 45, column: 9)
!50 = !DILocation(line: 45, column: 14, scope: !49)
!51 = !DILocation(line: 45, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !10, line: 45, column: 9)
!53 = !DILocation(line: 45, column: 25, scope: !52)
!54 = !DILocation(line: 45, column: 35, scope: !52)
!55 = !DILocation(line: 45, column: 23, scope: !52)
!56 = !DILocation(line: 45, column: 9, scope: !49)
!57 = !DILocation(line: 47, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !10, line: 46, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 13, scope: !58)
!61 = !DILocation(line: 47, column: 18, scope: !58)
!62 = !DILocation(line: 47, column: 21, scope: !58)
!63 = !DILocation(line: 48, column: 9, scope: !58)
!64 = !DILocation(line: 45, column: 41, scope: !52)
!65 = !DILocation(line: 45, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 48, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 49, column: 19, scope: !33)
!70 = !DILocation(line: 49, column: 9, scope: !33)
!71 = !DILocation(line: 50, column: 14, scope: !33)
!72 = !DILocation(line: 50, column: 9, scope: !33)
!73 = !DILocation(line: 52, column: 1, scope: !20)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_22_good", scope: !10, file: !10, line: 110, type: !21, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 112, column: 5, scope: !74)
!76 = !DILocation(line: 113, column: 5, scope: !74)
!77 = !DILocation(line: 114, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !79, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!11, !11, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !10, line: 126, type: !11)
!83 = !DILocation(line: 126, column: 14, scope: !78)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !10, line: 126, type: !81)
!85 = !DILocation(line: 126, column: 27, scope: !78)
!86 = !DILocation(line: 129, column: 22, scope: !78)
!87 = !DILocation(line: 129, column: 12, scope: !78)
!88 = !DILocation(line: 129, column: 5, scope: !78)
!89 = !DILocation(line: 131, column: 5, scope: !78)
!90 = !DILocation(line: 132, column: 5, scope: !78)
!91 = !DILocation(line: 133, column: 5, scope: !78)
!92 = !DILocation(line: 136, column: 5, scope: !78)
!93 = !DILocation(line: 137, column: 5, scope: !78)
!94 = !DILocation(line: 138, column: 5, scope: !78)
!95 = !DILocation(line: 140, column: 5, scope: !78)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 65, type: !21, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 67, type: !24)
!98 = !DILocation(line: 67, column: 12, scope: !96)
!99 = !DILocation(line: 68, column: 10, scope: !96)
!100 = !DILocation(line: 69, column: 77, scope: !96)
!101 = !DILocation(line: 70, column: 84, scope: !96)
!102 = !DILocation(line: 70, column: 12, scope: !96)
!103 = !DILocation(line: 70, column: 10, scope: !96)
!104 = !DILocalVariable(name: "source", scope: !105, file: !10, line: 72, type: !34)
!105 = distinct !DILexicalBlock(scope: !96, file: !10, line: 71, column: 5)
!106 = !DILocation(line: 72, column: 14, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !10, line: 73, type: !39)
!108 = !DILocation(line: 73, column: 16, scope: !105)
!109 = !DILocalVariable(name: "sourceLen", scope: !105, file: !10, line: 73, type: !39)
!110 = !DILocation(line: 73, column: 19, scope: !105)
!111 = !DILocation(line: 74, column: 28, scope: !105)
!112 = !DILocation(line: 74, column: 21, scope: !105)
!113 = !DILocation(line: 74, column: 19, scope: !105)
!114 = !DILocation(line: 77, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !10, line: 77, column: 9)
!116 = !DILocation(line: 77, column: 14, scope: !115)
!117 = !DILocation(line: 77, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 77, column: 9)
!119 = !DILocation(line: 77, column: 25, scope: !118)
!120 = !DILocation(line: 77, column: 35, scope: !118)
!121 = !DILocation(line: 77, column: 23, scope: !118)
!122 = !DILocation(line: 77, column: 9, scope: !115)
!123 = !DILocation(line: 79, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !10, line: 78, column: 9)
!125 = !DILocation(line: 79, column: 23, scope: !124)
!126 = !DILocation(line: 79, column: 13, scope: !124)
!127 = !DILocation(line: 79, column: 18, scope: !124)
!128 = !DILocation(line: 79, column: 21, scope: !124)
!129 = !DILocation(line: 80, column: 9, scope: !124)
!130 = !DILocation(line: 77, column: 41, scope: !118)
!131 = !DILocation(line: 77, column: 9, scope: !118)
!132 = distinct !{!132, !122, !133, !68}
!133 = !DILocation(line: 80, column: 9, scope: !115)
!134 = !DILocation(line: 81, column: 19, scope: !105)
!135 = !DILocation(line: 81, column: 9, scope: !105)
!136 = !DILocation(line: 82, column: 14, scope: !105)
!137 = !DILocation(line: 82, column: 9, scope: !105)
!138 = !DILocation(line: 84, column: 1, scope: !96)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "data", scope: !139, file: !10, line: 91, type: !24)
!141 = !DILocation(line: 91, column: 12, scope: !139)
!142 = !DILocation(line: 92, column: 10, scope: !139)
!143 = !DILocation(line: 93, column: 77, scope: !139)
!144 = !DILocation(line: 94, column: 84, scope: !139)
!145 = !DILocation(line: 94, column: 12, scope: !139)
!146 = !DILocation(line: 94, column: 10, scope: !139)
!147 = !DILocalVariable(name: "source", scope: !148, file: !10, line: 96, type: !34)
!148 = distinct !DILexicalBlock(scope: !139, file: !10, line: 95, column: 5)
!149 = !DILocation(line: 96, column: 14, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !148, file: !10, line: 97, type: !39)
!151 = !DILocation(line: 97, column: 16, scope: !148)
!152 = !DILocalVariable(name: "sourceLen", scope: !148, file: !10, line: 97, type: !39)
!153 = !DILocation(line: 97, column: 19, scope: !148)
!154 = !DILocation(line: 98, column: 28, scope: !148)
!155 = !DILocation(line: 98, column: 21, scope: !148)
!156 = !DILocation(line: 98, column: 19, scope: !148)
!157 = !DILocation(line: 101, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !148, file: !10, line: 101, column: 9)
!159 = !DILocation(line: 101, column: 14, scope: !158)
!160 = !DILocation(line: 101, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !10, line: 101, column: 9)
!162 = !DILocation(line: 101, column: 25, scope: !161)
!163 = !DILocation(line: 101, column: 35, scope: !161)
!164 = !DILocation(line: 101, column: 23, scope: !161)
!165 = !DILocation(line: 101, column: 9, scope: !158)
!166 = !DILocation(line: 103, column: 30, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !10, line: 102, column: 9)
!168 = !DILocation(line: 103, column: 23, scope: !167)
!169 = !DILocation(line: 103, column: 13, scope: !167)
!170 = !DILocation(line: 103, column: 18, scope: !167)
!171 = !DILocation(line: 103, column: 21, scope: !167)
!172 = !DILocation(line: 104, column: 9, scope: !167)
!173 = !DILocation(line: 101, column: 41, scope: !161)
!174 = !DILocation(line: 101, column: 9, scope: !161)
!175 = distinct !{!175, !165, !176, !68}
!176 = !DILocation(line: 104, column: 9, scope: !158)
!177 = !DILocation(line: 105, column: 19, scope: !148)
!178 = !DILocation(line: 105, column: 9, scope: !148)
!179 = !DILocation(line: 106, column: 14, scope: !148)
!180 = !DILocation(line: 106, column: 9, scope: !148)
!181 = !DILocation(line: 108, column: 1, scope: !139)
