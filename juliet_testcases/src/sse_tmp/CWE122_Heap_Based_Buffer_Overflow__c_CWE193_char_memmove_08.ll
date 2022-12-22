; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !33

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !43
  %add = add i64 %call5, 1, !dbg !44
  %mul = mul i64 %add, 1, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %4) #7, !dbg !49
  ret void, !dbg !50
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %call = call i32 @staticReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end3, !dbg !87

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !88
  store i8* %call1, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !103
  %add = add i64 %call5, 1, !dbg !104
  %mul = mul i64 %add, 1, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %3), !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %4) #7, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !111 {
entry:
  ret i32 0, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* null, i8** %data, align 8, !dbg !116
  %call = call i32 @staticReturnsTrue(), !dbg !117
  %tobool = icmp ne i32 %call, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end3, !dbg !119

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !120
  store i8* %call1, i8** %data, align 8, !dbg !122
  %0 = load i8*, i8** %data, align 8, !dbg !123
  %cmp = icmp eq i8* %0, null, !dbg !125
  br i1 %cmp, label %if.then2, label %if.end, !dbg !126

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !132
  %2 = load i8*, i8** %data, align 8, !dbg !133
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !134
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !135
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !136
  %add = add i64 %call5, 1, !dbg !137
  %mul = mul i64 %add, 1, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !134
  %3 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %3), !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %4) #7, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_bad", scope: !15, file: !15, line: 42, type: !16, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 44, type: !4)
!19 = !DILocation(line: 44, column: 12, scope: !14)
!20 = !DILocation(line: 45, column: 10, scope: !14)
!21 = !DILocation(line: 46, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 8)
!23 = !DILocation(line: 46, column: 8, scope: !14)
!24 = !DILocation(line: 49, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 5)
!26 = !DILocation(line: 49, column: 14, scope: !25)
!27 = !DILocation(line: 50, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 50, column: 13)
!29 = !DILocation(line: 50, column: 18, scope: !28)
!30 = !DILocation(line: 50, column: 13, scope: !25)
!31 = !DILocation(line: 50, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 50, column: 27)
!33 = !DILocation(line: 51, column: 5, scope: !25)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 53, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 52, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 53, column: 14, scope: !35)
!40 = !DILocation(line: 56, column: 17, scope: !35)
!41 = !DILocation(line: 56, column: 9, scope: !35)
!42 = !DILocation(line: 56, column: 39, scope: !35)
!43 = !DILocation(line: 56, column: 32, scope: !35)
!44 = !DILocation(line: 56, column: 47, scope: !35)
!45 = !DILocation(line: 56, column: 52, scope: !35)
!46 = !DILocation(line: 57, column: 19, scope: !35)
!47 = !DILocation(line: 57, column: 9, scope: !35)
!48 = !DILocation(line: 58, column: 14, scope: !35)
!49 = !DILocation(line: 58, column: 9, scope: !35)
!50 = !DILocation(line: 60, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_08_good", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 115, column: 5, scope: !51)
!53 = !DILocation(line: 116, column: 5, scope: !51)
!54 = !DILocation(line: 117, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 129, type: !56, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 129, type: !58)
!61 = !DILocation(line: 129, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 129, type: !59)
!63 = !DILocation(line: 129, column: 27, scope: !55)
!64 = !DILocation(line: 132, column: 22, scope: !55)
!65 = !DILocation(line: 132, column: 12, scope: !55)
!66 = !DILocation(line: 132, column: 5, scope: !55)
!67 = !DILocation(line: 134, column: 5, scope: !55)
!68 = !DILocation(line: 135, column: 5, scope: !55)
!69 = !DILocation(line: 136, column: 5, scope: !55)
!70 = !DILocation(line: 139, column: 5, scope: !55)
!71 = !DILocation(line: 140, column: 5, scope: !55)
!72 = !DILocation(line: 141, column: 5, scope: !55)
!73 = !DILocation(line: 143, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 32, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 69, type: !4)
!80 = !DILocation(line: 69, column: 12, scope: !78)
!81 = !DILocation(line: 70, column: 10, scope: !78)
!82 = !DILocation(line: 71, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !15, line: 71, column: 8)
!84 = !DILocation(line: 71, column: 8, scope: !78)
!85 = !DILocation(line: 74, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !15, line: 72, column: 5)
!87 = !DILocation(line: 75, column: 5, scope: !86)
!88 = !DILocation(line: 79, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !15, line: 77, column: 5)
!90 = !DILocation(line: 79, column: 14, scope: !89)
!91 = !DILocation(line: 80, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 80, column: 13)
!93 = !DILocation(line: 80, column: 18, scope: !92)
!94 = !DILocation(line: 80, column: 13, scope: !89)
!95 = !DILocation(line: 80, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 80, column: 27)
!97 = !DILocalVariable(name: "source", scope: !98, file: !15, line: 83, type: !36)
!98 = distinct !DILexicalBlock(scope: !78, file: !15, line: 82, column: 5)
!99 = !DILocation(line: 83, column: 14, scope: !98)
!100 = !DILocation(line: 86, column: 17, scope: !98)
!101 = !DILocation(line: 86, column: 9, scope: !98)
!102 = !DILocation(line: 86, column: 39, scope: !98)
!103 = !DILocation(line: 86, column: 32, scope: !98)
!104 = !DILocation(line: 86, column: 47, scope: !98)
!105 = !DILocation(line: 86, column: 52, scope: !98)
!106 = !DILocation(line: 87, column: 19, scope: !98)
!107 = !DILocation(line: 87, column: 9, scope: !98)
!108 = !DILocation(line: 88, column: 14, scope: !98)
!109 = !DILocation(line: 88, column: 9, scope: !98)
!110 = !DILocation(line: 90, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 35, type: !75, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocation(line: 37, column: 5, scope: !111)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 95, type: !4)
!115 = !DILocation(line: 95, column: 12, scope: !113)
!116 = !DILocation(line: 96, column: 10, scope: !113)
!117 = !DILocation(line: 97, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 97, column: 8)
!119 = !DILocation(line: 97, column: 8, scope: !113)
!120 = !DILocation(line: 100, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 98, column: 5)
!122 = !DILocation(line: 100, column: 14, scope: !121)
!123 = !DILocation(line: 101, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 101, column: 13)
!125 = !DILocation(line: 101, column: 18, scope: !124)
!126 = !DILocation(line: 101, column: 13, scope: !121)
!127 = !DILocation(line: 101, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 101, column: 27)
!129 = !DILocation(line: 102, column: 5, scope: !121)
!130 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 104, type: !36)
!131 = distinct !DILexicalBlock(scope: !113, file: !15, line: 103, column: 5)
!132 = !DILocation(line: 104, column: 14, scope: !131)
!133 = !DILocation(line: 107, column: 17, scope: !131)
!134 = !DILocation(line: 107, column: 9, scope: !131)
!135 = !DILocation(line: 107, column: 39, scope: !131)
!136 = !DILocation(line: 107, column: 32, scope: !131)
!137 = !DILocation(line: 107, column: 47, scope: !131)
!138 = !DILocation(line: 107, column: 52, scope: !131)
!139 = !DILocation(line: 108, column: 19, scope: !131)
!140 = !DILocation(line: 108, column: 9, scope: !131)
!141 = !DILocation(line: 109, column: 14, scope: !131)
!142 = !DILocation(line: 109, column: 9, scope: !131)
!143 = !DILocation(line: 111, column: 1, scope: !113)
