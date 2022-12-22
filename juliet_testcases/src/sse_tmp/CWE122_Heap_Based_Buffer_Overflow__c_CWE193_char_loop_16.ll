; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !31

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !45
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !46
  store i64 %call1, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !51
  %3 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %3, 1, !dbg !54
  %cmp2 = icmp ult i64 %2, %add, !dbg !55
  br i1 %cmp2, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i8, i8* %arrayidx, align 1, !dbg !59
  %6 = load i8*, i8** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !60
  store i8 %5, i8* %arrayidx3, align 1, !dbg !62
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  br label %while.body, !dbg !100

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !110

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !119
  store i64 %call1, i64* %sourceLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %3 = load i64, i64* %sourceLen, align 8, !dbg !126
  %add = add i64 %3, 1, !dbg !127
  %cmp2 = icmp ult i64 %2, %add, !dbg !128
  br i1 %cmp2, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !132
  %5 = load i8, i8* %arrayidx, align 1, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !133
  store i8 %5, i8* %arrayidx3, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %9), !dbg !142
  %10 = load i8*, i8** %data, align 8, !dbg !143
  call void @free(i8* %10) #7, !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 5, scope: !14)
!22 = !DILocation(line: 35, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!24 = !DILocation(line: 35, column: 14, scope: !23)
!25 = !DILocation(line: 36, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 36, column: 13)
!27 = !DILocation(line: 36, column: 18, scope: !26)
!28 = !DILocation(line: 36, column: 13, scope: !23)
!29 = !DILocation(line: 36, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 36, column: 27)
!31 = !DILocation(line: 37, column: 9, scope: !23)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 40, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 41, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 41, column: 16, scope: !33)
!43 = !DILocalVariable(name: "sourceLen", scope: !33, file: !15, line: 41, type: !39)
!44 = !DILocation(line: 41, column: 19, scope: !33)
!45 = !DILocation(line: 42, column: 28, scope: !33)
!46 = !DILocation(line: 42, column: 21, scope: !33)
!47 = !DILocation(line: 42, column: 19, scope: !33)
!48 = !DILocation(line: 45, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !15, line: 45, column: 9)
!50 = !DILocation(line: 45, column: 14, scope: !49)
!51 = !DILocation(line: 45, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 9)
!53 = !DILocation(line: 45, column: 25, scope: !52)
!54 = !DILocation(line: 45, column: 35, scope: !52)
!55 = !DILocation(line: 45, column: 23, scope: !52)
!56 = !DILocation(line: 45, column: 9, scope: !49)
!57 = !DILocation(line: 47, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !15, line: 46, column: 9)
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
!73 = !DILocation(line: 52, column: 1, scope: !14)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_16_good", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 87, column: 5, scope: !74)
!76 = !DILocation(line: 88, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !78, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !15, line: 100, type: !80)
!83 = !DILocation(line: 100, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !15, line: 100, type: !81)
!85 = !DILocation(line: 100, column: 27, scope: !77)
!86 = !DILocation(line: 103, column: 22, scope: !77)
!87 = !DILocation(line: 103, column: 12, scope: !77)
!88 = !DILocation(line: 103, column: 5, scope: !77)
!89 = !DILocation(line: 105, column: 5, scope: !77)
!90 = !DILocation(line: 106, column: 5, scope: !77)
!91 = !DILocation(line: 107, column: 5, scope: !77)
!92 = !DILocation(line: 110, column: 5, scope: !77)
!93 = !DILocation(line: 111, column: 5, scope: !77)
!94 = !DILocation(line: 112, column: 5, scope: !77)
!95 = !DILocation(line: 114, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 61, type: !4)
!98 = !DILocation(line: 61, column: 12, scope: !96)
!99 = !DILocation(line: 62, column: 10, scope: !96)
!100 = !DILocation(line: 63, column: 5, scope: !96)
!101 = !DILocation(line: 66, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !15, line: 64, column: 5)
!103 = !DILocation(line: 66, column: 14, scope: !102)
!104 = !DILocation(line: 67, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !15, line: 67, column: 13)
!106 = !DILocation(line: 67, column: 18, scope: !105)
!107 = !DILocation(line: 67, column: 13, scope: !102)
!108 = !DILocation(line: 67, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 67, column: 27)
!110 = !DILocation(line: 68, column: 9, scope: !102)
!111 = !DILocalVariable(name: "source", scope: !112, file: !15, line: 71, type: !34)
!112 = distinct !DILexicalBlock(scope: !96, file: !15, line: 70, column: 5)
!113 = !DILocation(line: 71, column: 14, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !15, line: 72, type: !39)
!115 = !DILocation(line: 72, column: 16, scope: !112)
!116 = !DILocalVariable(name: "sourceLen", scope: !112, file: !15, line: 72, type: !39)
!117 = !DILocation(line: 72, column: 19, scope: !112)
!118 = !DILocation(line: 73, column: 28, scope: !112)
!119 = !DILocation(line: 73, column: 21, scope: !112)
!120 = !DILocation(line: 73, column: 19, scope: !112)
!121 = !DILocation(line: 76, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !15, line: 76, column: 9)
!123 = !DILocation(line: 76, column: 14, scope: !122)
!124 = !DILocation(line: 76, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 76, column: 9)
!126 = !DILocation(line: 76, column: 25, scope: !125)
!127 = !DILocation(line: 76, column: 35, scope: !125)
!128 = !DILocation(line: 76, column: 23, scope: !125)
!129 = !DILocation(line: 76, column: 9, scope: !122)
!130 = !DILocation(line: 78, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !15, line: 77, column: 9)
!132 = !DILocation(line: 78, column: 23, scope: !131)
!133 = !DILocation(line: 78, column: 13, scope: !131)
!134 = !DILocation(line: 78, column: 18, scope: !131)
!135 = !DILocation(line: 78, column: 21, scope: !131)
!136 = !DILocation(line: 79, column: 9, scope: !131)
!137 = !DILocation(line: 76, column: 41, scope: !125)
!138 = !DILocation(line: 76, column: 9, scope: !125)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 79, column: 9, scope: !122)
!141 = !DILocation(line: 80, column: 19, scope: !112)
!142 = !DILocation(line: 80, column: 9, scope: !112)
!143 = !DILocation(line: 81, column: 14, scope: !112)
!144 = !DILocation(line: 81, column: 9, scope: !112)
!145 = !DILocation(line: 83, column: 1, scope: !96)
