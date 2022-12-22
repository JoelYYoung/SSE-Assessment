; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !40
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !41
  %add = add i64 %call3, 1, !dbg !42
  %call4 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %3), !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %4) #7, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  br label %source, !dbg !75

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !76), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !88
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !90
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !91
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !92
  %add = add i64 %call3, 1, !dbg !93
  %call4 = call i8* @strncpy(i8* %2, i8* %arraydecay, i64 %add) #7, !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %3), !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  call void @free(i8* %4) #7, !dbg !98
  ret void, !dbg !99
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !15, line: 33)
!23 = !DILocation(line: 33, column: 1, scope: !14)
!24 = !DILocation(line: 35, column: 20, scope: !14)
!25 = !DILocation(line: 35, column: 10, scope: !14)
!26 = !DILocation(line: 36, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!28 = !DILocation(line: 36, column: 14, scope: !27)
!29 = !DILocation(line: 36, column: 9, scope: !14)
!30 = !DILocation(line: 36, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 36, column: 23)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 38, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 38, column: 14, scope: !33)
!38 = !DILocation(line: 41, column: 17, scope: !33)
!39 = !DILocation(line: 41, column: 23, scope: !33)
!40 = !DILocation(line: 41, column: 38, scope: !33)
!41 = !DILocation(line: 41, column: 31, scope: !33)
!42 = !DILocation(line: 41, column: 46, scope: !33)
!43 = !DILocation(line: 41, column: 9, scope: !33)
!44 = !DILocation(line: 42, column: 19, scope: !33)
!45 = !DILocation(line: 42, column: 9, scope: !33)
!46 = !DILocation(line: 43, column: 14, scope: !33)
!47 = !DILocation(line: 43, column: 9, scope: !33)
!48 = !DILocation(line: 45, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 73, column: 5, scope: !49)
!51 = !DILocation(line: 74, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 86, type: !53, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 86, type: !55)
!58 = !DILocation(line: 86, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 86, type: !56)
!60 = !DILocation(line: 86, column: 27, scope: !52)
!61 = !DILocation(line: 89, column: 22, scope: !52)
!62 = !DILocation(line: 89, column: 12, scope: !52)
!63 = !DILocation(line: 89, column: 5, scope: !52)
!64 = !DILocation(line: 91, column: 5, scope: !52)
!65 = !DILocation(line: 92, column: 5, scope: !52)
!66 = !DILocation(line: 93, column: 5, scope: !52)
!67 = !DILocation(line: 96, column: 5, scope: !52)
!68 = !DILocation(line: 97, column: 5, scope: !52)
!69 = !DILocation(line: 98, column: 5, scope: !52)
!70 = !DILocation(line: 100, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 54, type: !4)
!73 = !DILocation(line: 54, column: 12, scope: !71)
!74 = !DILocation(line: 55, column: 10, scope: !71)
!75 = !DILocation(line: 56, column: 5, scope: !71)
!76 = !DILabel(scope: !71, name: "source", file: !15, line: 57)
!77 = !DILocation(line: 57, column: 1, scope: !71)
!78 = !DILocation(line: 59, column: 20, scope: !71)
!79 = !DILocation(line: 59, column: 10, scope: !71)
!80 = !DILocation(line: 60, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !71, file: !15, line: 60, column: 9)
!82 = !DILocation(line: 60, column: 14, scope: !81)
!83 = !DILocation(line: 60, column: 9, scope: !71)
!84 = !DILocation(line: 60, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 60, column: 23)
!86 = !DILocalVariable(name: "source", scope: !87, file: !15, line: 62, type: !34)
!87 = distinct !DILexicalBlock(scope: !71, file: !15, line: 61, column: 5)
!88 = !DILocation(line: 62, column: 14, scope: !87)
!89 = !DILocation(line: 65, column: 17, scope: !87)
!90 = !DILocation(line: 65, column: 23, scope: !87)
!91 = !DILocation(line: 65, column: 38, scope: !87)
!92 = !DILocation(line: 65, column: 31, scope: !87)
!93 = !DILocation(line: 65, column: 46, scope: !87)
!94 = !DILocation(line: 65, column: 9, scope: !87)
!95 = !DILocation(line: 66, column: 19, scope: !87)
!96 = !DILocation(line: 66, column: 9, scope: !87)
!97 = !DILocation(line: 67, column: 14, scope: !87)
!98 = !DILocation(line: 67, column: 9, scope: !87)
!99 = !DILocation(line: 69, column: 1, scope: !71)
