; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %1, 0, !dbg !28
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !30

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %call3 = call i64 @strlen(i8* %6) #9, !dbg !46
  %call4 = call i8* @strncpy(i8* %arraydecay, i8* %5, i64 %call3) #7, !dbg !47
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx5, align 1, !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %7), !dbg !51
  %8 = load i8*, i8** %data, align 8, !dbg !52
  call void @free(i8* %8) #7, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFalse, align 4, !dbg !89
  %tobool = icmp ne i32 %1, 0, !dbg !89
  br i1 %tobool, label %if.then1, label %if.else, !dbg !91

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end2, !dbg !94

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %6 = load i8*, i8** %data, align 8, !dbg !105
  %call3 = call i64 @strlen(i8* %6) #9, !dbg !106
  %call4 = call i8* @strncpy(i8* %arraydecay, i8* %5, i64 %call3) #7, !dbg !107
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !108
  store i8 0, i8* %arrayidx5, align 1, !dbg !109
  %7 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %7), !dbg !111
  %8 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %8) #7, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !118
  store i8* %call, i8** %data, align 8, !dbg !119
  %0 = load i8*, i8** %data, align 8, !dbg !120
  %cmp = icmp eq i8* %0, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !126
  %tobool = icmp ne i32 %1, 0, !dbg !126
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !128

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  br label %if.end2, !dbg !134

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !137
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !138
  %5 = load i8*, i8** %data, align 8, !dbg !139
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %call3 = call i64 @strlen(i8* %6) #9, !dbg !141
  %call4 = call i8* @strncpy(i8* %arraydecay, i8* %5, i64 %call3) #7, !dbg !142
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !143
  store i8 0, i8* %arrayidx5, align 1, !dbg !144
  %7 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* %7), !dbg !146
  %8 = load i8*, i8** %data, align 8, !dbg !147
  call void @free(i8* %8) #7, !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !14)
!31 = !DILocation(line: 31, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocation(line: 37, column: 17, scope: !38)
!44 = !DILocation(line: 37, column: 23, scope: !38)
!45 = !DILocation(line: 37, column: 36, scope: !38)
!46 = !DILocation(line: 37, column: 29, scope: !38)
!47 = !DILocation(line: 37, column: 9, scope: !38)
!48 = !DILocation(line: 38, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 20, scope: !38)
!50 = !DILocation(line: 39, column: 19, scope: !38)
!51 = !DILocation(line: 39, column: 9, scope: !38)
!52 = !DILocation(line: 40, column: 14, scope: !38)
!53 = !DILocation(line: 40, column: 9, scope: !38)
!54 = !DILocation(line: 42, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_10_good", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 99, column: 5, scope: !55)
!57 = !DILocation(line: 100, column: 5, scope: !55)
!58 = !DILocation(line: 101, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !60, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 113, type: !62)
!65 = !DILocation(line: 113, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 113, type: !63)
!67 = !DILocation(line: 113, column: 27, scope: !59)
!68 = !DILocation(line: 116, column: 22, scope: !59)
!69 = !DILocation(line: 116, column: 12, scope: !59)
!70 = !DILocation(line: 116, column: 5, scope: !59)
!71 = !DILocation(line: 118, column: 5, scope: !59)
!72 = !DILocation(line: 119, column: 5, scope: !59)
!73 = !DILocation(line: 120, column: 5, scope: !59)
!74 = !DILocation(line: 123, column: 5, scope: !59)
!75 = !DILocation(line: 124, column: 5, scope: !59)
!76 = !DILocation(line: 125, column: 5, scope: !59)
!77 = !DILocation(line: 127, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 51, type: !4)
!80 = !DILocation(line: 51, column: 12, scope: !78)
!81 = !DILocation(line: 52, column: 20, scope: !78)
!82 = !DILocation(line: 52, column: 10, scope: !78)
!83 = !DILocation(line: 53, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 53, column: 9)
!85 = !DILocation(line: 53, column: 14, scope: !84)
!86 = !DILocation(line: 53, column: 9, scope: !78)
!87 = !DILocation(line: 53, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 53, column: 23)
!89 = !DILocation(line: 54, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !15, line: 54, column: 8)
!91 = !DILocation(line: 54, column: 8, scope: !78)
!92 = !DILocation(line: 57, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 55, column: 5)
!94 = !DILocation(line: 58, column: 5, scope: !93)
!95 = !DILocation(line: 62, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 60, column: 5)
!97 = !DILocation(line: 62, column: 9, scope: !96)
!98 = !DILocation(line: 63, column: 9, scope: !96)
!99 = !DILocation(line: 63, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !15, line: 66, type: !39)
!101 = distinct !DILexicalBlock(scope: !78, file: !15, line: 65, column: 5)
!102 = !DILocation(line: 66, column: 14, scope: !101)
!103 = !DILocation(line: 68, column: 17, scope: !101)
!104 = !DILocation(line: 68, column: 23, scope: !101)
!105 = !DILocation(line: 68, column: 36, scope: !101)
!106 = !DILocation(line: 68, column: 29, scope: !101)
!107 = !DILocation(line: 68, column: 9, scope: !101)
!108 = !DILocation(line: 69, column: 9, scope: !101)
!109 = !DILocation(line: 69, column: 20, scope: !101)
!110 = !DILocation(line: 70, column: 19, scope: !101)
!111 = !DILocation(line: 70, column: 9, scope: !101)
!112 = !DILocation(line: 71, column: 14, scope: !101)
!113 = !DILocation(line: 71, column: 9, scope: !101)
!114 = !DILocation(line: 73, column: 1, scope: !78)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !15, line: 78, type: !4)
!117 = !DILocation(line: 78, column: 12, scope: !115)
!118 = !DILocation(line: 79, column: 20, scope: !115)
!119 = !DILocation(line: 79, column: 10, scope: !115)
!120 = !DILocation(line: 80, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !15, line: 80, column: 9)
!122 = !DILocation(line: 80, column: 14, scope: !121)
!123 = !DILocation(line: 80, column: 9, scope: !115)
!124 = !DILocation(line: 80, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 80, column: 23)
!126 = !DILocation(line: 81, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !115, file: !15, line: 81, column: 8)
!128 = !DILocation(line: 81, column: 8, scope: !115)
!129 = !DILocation(line: 84, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 82, column: 5)
!131 = !DILocation(line: 84, column: 9, scope: !130)
!132 = !DILocation(line: 85, column: 9, scope: !130)
!133 = !DILocation(line: 85, column: 20, scope: !130)
!134 = !DILocation(line: 86, column: 5, scope: !130)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !15, line: 88, type: !39)
!136 = distinct !DILexicalBlock(scope: !115, file: !15, line: 87, column: 5)
!137 = !DILocation(line: 88, column: 14, scope: !136)
!138 = !DILocation(line: 90, column: 17, scope: !136)
!139 = !DILocation(line: 90, column: 23, scope: !136)
!140 = !DILocation(line: 90, column: 36, scope: !136)
!141 = !DILocation(line: 90, column: 29, scope: !136)
!142 = !DILocation(line: 90, column: 9, scope: !136)
!143 = !DILocation(line: 91, column: 9, scope: !136)
!144 = !DILocation(line: 91, column: 20, scope: !136)
!145 = !DILocation(line: 92, column: 19, scope: !136)
!146 = !DILocation(line: 92, column: 9, scope: !136)
!147 = !DILocation(line: 93, column: 14, scope: !136)
!148 = !DILocation(line: 93, column: 9, scope: !136)
!149 = !DILocation(line: 95, column: 1, scope: !115)
