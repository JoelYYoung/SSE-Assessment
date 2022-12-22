; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !31, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !33
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !34
  store i64 %call, i64* %sourceLen, align 8, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %2 = load i64, i64* %sourceLen, align 8, !dbg !41
  %add = add i64 %2, 1, !dbg !42
  %cmp = icmp ult i64 %1, %add, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !47
  %4 = load i8, i8* %arrayidx, align 1, !dbg !47
  %5 = load i8*, i8** %data.addr, align 8, !dbg !48
  %6 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !48
  store i8 %4, i8* %arrayidx1, align 1, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %7, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* %8), !dbg !58
  %9 = load i8*, i8** %data.addr, align 8, !dbg !59
  call void @free(i8* %9) #8, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_bad() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i8* null, i8** %data, align 8, !dbg !67
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !68
  store i8* %call, i8** %data, align 8, !dbg !69
  %0 = load i8*, i8** %data, align 8, !dbg !70
  %cmp = icmp eq i8* %0, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_badSink(i8* %1), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_goodG2BSink(i8* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !89
  %call = call i64 @strlen(i8* %arraydecay) #7, !dbg !90
  store i64 %call, i64* %sourceLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !95
  %2 = load i64, i64* %sourceLen, align 8, !dbg !97
  %add = add i64 %2, 1, !dbg !98
  %cmp = icmp ult i64 %1, %add, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !103
  %4 = load i8, i8* %arrayidx, align 1, !dbg !103
  %5 = load i8*, i8** %data.addr, align 8, !dbg !104
  %6 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !104
  store i8 %4, i8* %arrayidx1, align 1, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %7, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !112
  call void @printLine(i8* %8), !dbg !113
  %9 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @free(i8* %9) #8, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_good() #0 !dbg !117 {
entry:
  call void @goodG2B(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i64 @time(i64* null) #8, !dbg !129
  %conv = trunc i64 %call to i32, !dbg !130
  call void @srand(i32 %conv) #8, !dbg !131
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_good(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_bad(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !137
  ret i32 0, !dbg !138
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i8* null, i8** %data, align 8, !dbg !142
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !143
  store i8* %call, i8** %data, align 8, !dbg !144
  %0 = load i8*, i8** %data, align 8, !dbg !145
  %cmp = icmp eq i8* %0, null, !dbg !147
  br i1 %cmp, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !151
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_goodG2BSink(i8* %1), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_badSink", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 28, type: !4)
!19 = !DILocation(line: 28, column: 78, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 31, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 31, column: 14, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 32, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 46, baseType: !29)
!28 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 32, column: 16, scope: !21)
!31 = !DILocalVariable(name: "sourceLen", scope: !21, file: !15, line: 32, type: !27)
!32 = !DILocation(line: 32, column: 19, scope: !21)
!33 = !DILocation(line: 33, column: 28, scope: !21)
!34 = !DILocation(line: 33, column: 21, scope: !21)
!35 = !DILocation(line: 33, column: 19, scope: !21)
!36 = !DILocation(line: 36, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !21, file: !15, line: 36, column: 9)
!38 = !DILocation(line: 36, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !15, line: 36, column: 9)
!41 = !DILocation(line: 36, column: 25, scope: !40)
!42 = !DILocation(line: 36, column: 35, scope: !40)
!43 = !DILocation(line: 36, column: 23, scope: !40)
!44 = !DILocation(line: 36, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 30, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !15, line: 37, column: 9)
!47 = !DILocation(line: 38, column: 23, scope: !46)
!48 = !DILocation(line: 38, column: 13, scope: !46)
!49 = !DILocation(line: 38, column: 18, scope: !46)
!50 = !DILocation(line: 38, column: 21, scope: !46)
!51 = !DILocation(line: 39, column: 9, scope: !46)
!52 = !DILocation(line: 36, column: 41, scope: !40)
!53 = !DILocation(line: 36, column: 9, scope: !40)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 39, column: 9, scope: !37)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 40, column: 19, scope: !21)
!58 = !DILocation(line: 40, column: 9, scope: !21)
!59 = !DILocation(line: 41, column: 14, scope: !21)
!60 = !DILocation(line: 41, column: 9, scope: !21)
!61 = !DILocation(line: 43, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_bad", scope: !15, file: !15, line: 45, type: !63, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{null}
!65 = !DILocalVariable(name: "data", scope: !62, file: !15, line: 47, type: !4)
!66 = !DILocation(line: 47, column: 12, scope: !62)
!67 = !DILocation(line: 48, column: 10, scope: !62)
!68 = !DILocation(line: 50, column: 20, scope: !62)
!69 = !DILocation(line: 50, column: 10, scope: !62)
!70 = !DILocation(line: 51, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !62, file: !15, line: 51, column: 9)
!72 = !DILocation(line: 51, column: 14, scope: !71)
!73 = !DILocation(line: 51, column: 9, scope: !62)
!74 = !DILocation(line: 51, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 51, column: 23)
!76 = !DILocation(line: 52, column: 70, scope: !62)
!77 = !DILocation(line: 52, column: 5, scope: !62)
!78 = !DILocation(line: 53, column: 1, scope: !62)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !15, line: 59, type: !4)
!81 = !DILocation(line: 59, column: 82, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !15, line: 62, type: !22)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 61, column: 5)
!84 = !DILocation(line: 62, column: 14, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !83, file: !15, line: 63, type: !27)
!86 = !DILocation(line: 63, column: 16, scope: !83)
!87 = !DILocalVariable(name: "sourceLen", scope: !83, file: !15, line: 63, type: !27)
!88 = !DILocation(line: 63, column: 19, scope: !83)
!89 = !DILocation(line: 64, column: 28, scope: !83)
!90 = !DILocation(line: 64, column: 21, scope: !83)
!91 = !DILocation(line: 64, column: 19, scope: !83)
!92 = !DILocation(line: 67, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !15, line: 67, column: 9)
!94 = !DILocation(line: 67, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !15, line: 67, column: 9)
!97 = !DILocation(line: 67, column: 25, scope: !96)
!98 = !DILocation(line: 67, column: 35, scope: !96)
!99 = !DILocation(line: 67, column: 23, scope: !96)
!100 = !DILocation(line: 67, column: 9, scope: !93)
!101 = !DILocation(line: 69, column: 30, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !15, line: 68, column: 9)
!103 = !DILocation(line: 69, column: 23, scope: !102)
!104 = !DILocation(line: 69, column: 13, scope: !102)
!105 = !DILocation(line: 69, column: 18, scope: !102)
!106 = !DILocation(line: 69, column: 21, scope: !102)
!107 = !DILocation(line: 70, column: 9, scope: !102)
!108 = !DILocation(line: 67, column: 41, scope: !96)
!109 = !DILocation(line: 67, column: 9, scope: !96)
!110 = distinct !{!110, !100, !111, !56}
!111 = !DILocation(line: 70, column: 9, scope: !93)
!112 = !DILocation(line: 71, column: 19, scope: !83)
!113 = !DILocation(line: 71, column: 9, scope: !83)
!114 = !DILocation(line: 72, column: 14, scope: !83)
!115 = !DILocation(line: 72, column: 9, scope: !83)
!116 = !DILocation(line: 74, column: 1, scope: !79)
!117 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_41_good", scope: !15, file: !15, line: 87, type: !63, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocation(line: 89, column: 5, scope: !117)
!119 = !DILocation(line: 90, column: 1, scope: !117)
!120 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !121, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DISubroutineType(types: !122)
!122 = !{!123, !123, !124}
!123 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!125 = !DILocalVariable(name: "argc", arg: 1, scope: !120, file: !15, line: 102, type: !123)
!126 = !DILocation(line: 102, column: 14, scope: !120)
!127 = !DILocalVariable(name: "argv", arg: 2, scope: !120, file: !15, line: 102, type: !124)
!128 = !DILocation(line: 102, column: 27, scope: !120)
!129 = !DILocation(line: 105, column: 22, scope: !120)
!130 = !DILocation(line: 105, column: 12, scope: !120)
!131 = !DILocation(line: 105, column: 5, scope: !120)
!132 = !DILocation(line: 107, column: 5, scope: !120)
!133 = !DILocation(line: 108, column: 5, scope: !120)
!134 = !DILocation(line: 109, column: 5, scope: !120)
!135 = !DILocation(line: 112, column: 5, scope: !120)
!136 = !DILocation(line: 113, column: 5, scope: !120)
!137 = !DILocation(line: 114, column: 5, scope: !120)
!138 = !DILocation(line: 116, column: 5, scope: !120)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 77, type: !63, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 79, type: !4)
!141 = !DILocation(line: 79, column: 12, scope: !139)
!142 = !DILocation(line: 80, column: 10, scope: !139)
!143 = !DILocation(line: 82, column: 20, scope: !139)
!144 = !DILocation(line: 82, column: 10, scope: !139)
!145 = !DILocation(line: 83, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !15, line: 83, column: 9)
!147 = !DILocation(line: 83, column: 14, scope: !146)
!148 = !DILocation(line: 83, column: 9, scope: !139)
!149 = !DILocation(line: 83, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !15, line: 83, column: 23)
!151 = !DILocation(line: 84, column: 74, scope: !139)
!152 = !DILocation(line: 84, column: 5, scope: !139)
!153 = !DILocation(line: 85, column: 1, scope: !139)
