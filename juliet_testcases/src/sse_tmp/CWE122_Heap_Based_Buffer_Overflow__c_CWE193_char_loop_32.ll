; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !40
  store i8* %3, i8** %4, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !45
  %6 = load i8*, i8** %5, align 8, !dbg !46
  store i8* %6, i8** %data2, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !61
  store i64 %call3, i64* %sourceLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !66
  %9 = load i64, i64* %sourceLen, align 8, !dbg !68
  %add = add i64 %9, 1, !dbg !69
  %cmp4 = icmp ult i64 %8, %add, !dbg !70
  br i1 %cmp4, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !74
  %11 = load i8, i8* %arrayidx, align 1, !dbg !74
  %12 = load i8*, i8** %data2, align 8, !dbg !75
  %13 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !75
  store i8 %11, i8* %arrayidx5, align 1, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %14, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !84
  call void @printLine(i8* %15), !dbg !85
  %16 = load i8*, i8** %data2, align 8, !dbg !86
  call void @free(i8* %16) #7, !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !121
  %1 = load i8*, i8** %0, align 8, !dbg !122
  store i8* %1, i8** %data1, align 8, !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !123
  store i8* %call, i8** %data1, align 8, !dbg !124
  %2 = load i8*, i8** %data1, align 8, !dbg !125
  %cmp = icmp eq i8* %2, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !131
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !132
  store i8* %3, i8** %4, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !134, metadata !DIExpression()), !dbg !136
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !137
  %6 = load i8*, i8** %5, align 8, !dbg !138
  store i8* %6, i8** %data2, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !146
  %call3 = call i64 @strlen(i8* %arraydecay) #9, !dbg !147
  store i64 %call3, i64* %sourceLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !152
  %9 = load i64, i64* %sourceLen, align 8, !dbg !154
  %add = add i64 %9, 1, !dbg !155
  %cmp4 = icmp ult i64 %8, %add, !dbg !156
  br i1 %cmp4, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !160
  %11 = load i8, i8* %arrayidx, align 1, !dbg !160
  %12 = load i8*, i8** %data2, align 8, !dbg !161
  %13 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !161
  store i8 %11, i8* %arrayidx5, align 1, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %14, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !169
  call void @printLine(i8* %15), !dbg !170
  %16 = load i8*, i8** %data2, align 8, !dbg !171
  call void @free(i8* %16) #7, !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !14)
!25 = !DILocation(line: 33, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 35, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 24, scope: !27)
!30 = !DILocation(line: 35, column: 23, scope: !27)
!31 = !DILocation(line: 37, column: 24, scope: !27)
!32 = !DILocation(line: 37, column: 14, scope: !27)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !27)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 21, scope: !27)
!40 = !DILocation(line: 39, column: 10, scope: !27)
!41 = !DILocation(line: 39, column: 19, scope: !27)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 42, type: !4)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!44 = !DILocation(line: 42, column: 16, scope: !43)
!45 = !DILocation(line: 42, column: 24, scope: !43)
!46 = !DILocation(line: 42, column: 23, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !48, file: !15, line: 44, type: !49)
!48 = distinct !DILexicalBlock(scope: !43, file: !15, line: 43, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 44, column: 18, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !15, line: 45, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 45, column: 20, scope: !48)
!58 = !DILocalVariable(name: "sourceLen", scope: !48, file: !15, line: 45, type: !54)
!59 = !DILocation(line: 45, column: 23, scope: !48)
!60 = !DILocation(line: 46, column: 32, scope: !48)
!61 = !DILocation(line: 46, column: 25, scope: !48)
!62 = !DILocation(line: 46, column: 23, scope: !48)
!63 = !DILocation(line: 49, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !48, file: !15, line: 49, column: 13)
!65 = !DILocation(line: 49, column: 18, scope: !64)
!66 = !DILocation(line: 49, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 49, column: 13)
!68 = !DILocation(line: 49, column: 29, scope: !67)
!69 = !DILocation(line: 49, column: 39, scope: !67)
!70 = !DILocation(line: 49, column: 27, scope: !67)
!71 = !DILocation(line: 49, column: 13, scope: !64)
!72 = !DILocation(line: 51, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !67, file: !15, line: 50, column: 13)
!74 = !DILocation(line: 51, column: 27, scope: !73)
!75 = !DILocation(line: 51, column: 17, scope: !73)
!76 = !DILocation(line: 51, column: 22, scope: !73)
!77 = !DILocation(line: 51, column: 25, scope: !73)
!78 = !DILocation(line: 52, column: 13, scope: !73)
!79 = !DILocation(line: 49, column: 45, scope: !67)
!80 = !DILocation(line: 49, column: 13, scope: !67)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 52, column: 13, scope: !64)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 53, column: 23, scope: !48)
!85 = !DILocation(line: 53, column: 13, scope: !48)
!86 = !DILocation(line: 54, column: 18, scope: !48)
!87 = !DILocation(line: 54, column: 13, scope: !48)
!88 = !DILocation(line: 57, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_32_good", scope: !15, file: !15, line: 95, type: !16, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 97, column: 5, scope: !89)
!91 = !DILocation(line: 98, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 109, type: !93, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !21}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 109, type: !95)
!97 = !DILocation(line: 109, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 109, type: !21)
!99 = !DILocation(line: 109, column: 27, scope: !92)
!100 = !DILocation(line: 112, column: 22, scope: !92)
!101 = !DILocation(line: 112, column: 12, scope: !92)
!102 = !DILocation(line: 112, column: 5, scope: !92)
!103 = !DILocation(line: 114, column: 5, scope: !92)
!104 = !DILocation(line: 115, column: 5, scope: !92)
!105 = !DILocation(line: 116, column: 5, scope: !92)
!106 = !DILocation(line: 119, column: 5, scope: !92)
!107 = !DILocation(line: 120, column: 5, scope: !92)
!108 = !DILocation(line: 121, column: 5, scope: !92)
!109 = !DILocation(line: 123, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 66, type: !4)
!112 = !DILocation(line: 66, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataPtr1", scope: !110, file: !15, line: 67, type: !21)
!114 = !DILocation(line: 67, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataPtr2", scope: !110, file: !15, line: 68, type: !21)
!116 = !DILocation(line: 68, column: 13, scope: !110)
!117 = !DILocation(line: 69, column: 10, scope: !110)
!118 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 71, type: !4)
!119 = distinct !DILexicalBlock(scope: !110, file: !15, line: 70, column: 5)
!120 = !DILocation(line: 71, column: 16, scope: !119)
!121 = !DILocation(line: 71, column: 24, scope: !119)
!122 = !DILocation(line: 71, column: 23, scope: !119)
!123 = !DILocation(line: 73, column: 24, scope: !119)
!124 = !DILocation(line: 73, column: 14, scope: !119)
!125 = !DILocation(line: 74, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !15, line: 74, column: 13)
!127 = !DILocation(line: 74, column: 18, scope: !126)
!128 = !DILocation(line: 74, column: 13, scope: !119)
!129 = !DILocation(line: 74, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 74, column: 27)
!131 = !DILocation(line: 75, column: 21, scope: !119)
!132 = !DILocation(line: 75, column: 10, scope: !119)
!133 = !DILocation(line: 75, column: 19, scope: !119)
!134 = !DILocalVariable(name: "data", scope: !135, file: !15, line: 78, type: !4)
!135 = distinct !DILexicalBlock(scope: !110, file: !15, line: 77, column: 5)
!136 = !DILocation(line: 78, column: 16, scope: !135)
!137 = !DILocation(line: 78, column: 24, scope: !135)
!138 = !DILocation(line: 78, column: 23, scope: !135)
!139 = !DILocalVariable(name: "source", scope: !140, file: !15, line: 80, type: !49)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 79, column: 9)
!141 = !DILocation(line: 80, column: 18, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !140, file: !15, line: 81, type: !54)
!143 = !DILocation(line: 81, column: 20, scope: !140)
!144 = !DILocalVariable(name: "sourceLen", scope: !140, file: !15, line: 81, type: !54)
!145 = !DILocation(line: 81, column: 23, scope: !140)
!146 = !DILocation(line: 82, column: 32, scope: !140)
!147 = !DILocation(line: 82, column: 25, scope: !140)
!148 = !DILocation(line: 82, column: 23, scope: !140)
!149 = !DILocation(line: 85, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !15, line: 85, column: 13)
!151 = !DILocation(line: 85, column: 18, scope: !150)
!152 = !DILocation(line: 85, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 85, column: 13)
!154 = !DILocation(line: 85, column: 29, scope: !153)
!155 = !DILocation(line: 85, column: 39, scope: !153)
!156 = !DILocation(line: 85, column: 27, scope: !153)
!157 = !DILocation(line: 85, column: 13, scope: !150)
!158 = !DILocation(line: 87, column: 34, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !15, line: 86, column: 13)
!160 = !DILocation(line: 87, column: 27, scope: !159)
!161 = !DILocation(line: 87, column: 17, scope: !159)
!162 = !DILocation(line: 87, column: 22, scope: !159)
!163 = !DILocation(line: 87, column: 25, scope: !159)
!164 = !DILocation(line: 88, column: 13, scope: !159)
!165 = !DILocation(line: 85, column: 45, scope: !153)
!166 = !DILocation(line: 85, column: 13, scope: !153)
!167 = distinct !{!167, !157, !168, !83}
!168 = !DILocation(line: 88, column: 13, scope: !150)
!169 = !DILocation(line: 89, column: 23, scope: !140)
!170 = !DILocation(line: 89, column: 13, scope: !140)
!171 = !DILocation(line: 90, column: 18, scope: !140)
!172 = !DILocation(line: 90, column: 13, scope: !140)
!173 = !DILocation(line: 93, column: 1, scope: !110)
