; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %call3 = call i8* @strcpy(i8* %2, i8* %arraydecay2) #6, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %3), !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* %4) #6, !dbg !46
  ret void, !dbg !47
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
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx1, align 1, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !91
  %call3 = call i8* @strcpy(i8* %2, i8* %arraydecay2) #6, !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %3), !dbg !94
  %4 = load i8*, i8** %data, align 8, !dbg !95
  call void @free(i8* %4) #6, !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 13, scope: !14)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 32, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 32, column: 14, scope: !32)
!37 = !DILocation(line: 33, column: 9, scope: !32)
!38 = !DILocation(line: 34, column: 9, scope: !32)
!39 = !DILocation(line: 34, column: 23, scope: !32)
!40 = !DILocation(line: 36, column: 16, scope: !32)
!41 = !DILocation(line: 36, column: 22, scope: !32)
!42 = !DILocation(line: 36, column: 9, scope: !32)
!43 = !DILocation(line: 37, column: 19, scope: !32)
!44 = !DILocation(line: 37, column: 9, scope: !32)
!45 = !DILocation(line: 38, column: 14, scope: !32)
!46 = !DILocation(line: 38, column: 9, scope: !32)
!47 = !DILocation(line: 40, column: 1, scope: !14)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_01_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 68, column: 5, scope: !48)
!50 = !DILocation(line: 69, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !52, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !15, line: 81, type: !54)
!57 = !DILocation(line: 81, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !15, line: 81, type: !55)
!59 = !DILocation(line: 81, column: 27, scope: !51)
!60 = !DILocation(line: 84, column: 22, scope: !51)
!61 = !DILocation(line: 84, column: 12, scope: !51)
!62 = !DILocation(line: 84, column: 5, scope: !51)
!63 = !DILocation(line: 86, column: 5, scope: !51)
!64 = !DILocation(line: 87, column: 5, scope: !51)
!65 = !DILocation(line: 88, column: 5, scope: !51)
!66 = !DILocation(line: 91, column: 5, scope: !51)
!67 = !DILocation(line: 92, column: 5, scope: !51)
!68 = !DILocation(line: 93, column: 5, scope: !51)
!69 = !DILocation(line: 95, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 47, type: !16, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !15, line: 49, type: !4)
!72 = !DILocation(line: 49, column: 12, scope: !70)
!73 = !DILocation(line: 50, column: 10, scope: !70)
!74 = !DILocation(line: 52, column: 20, scope: !70)
!75 = !DILocation(line: 52, column: 10, scope: !70)
!76 = !DILocation(line: 53, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !70, file: !15, line: 53, column: 9)
!78 = !DILocation(line: 53, column: 14, scope: !77)
!79 = !DILocation(line: 53, column: 9, scope: !70)
!80 = !DILocation(line: 53, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 53, column: 23)
!82 = !DILocation(line: 54, column: 5, scope: !70)
!83 = !DILocation(line: 54, column: 13, scope: !70)
!84 = !DILocalVariable(name: "source", scope: !85, file: !15, line: 56, type: !33)
!85 = distinct !DILexicalBlock(scope: !70, file: !15, line: 55, column: 5)
!86 = !DILocation(line: 56, column: 14, scope: !85)
!87 = !DILocation(line: 57, column: 9, scope: !85)
!88 = !DILocation(line: 58, column: 9, scope: !85)
!89 = !DILocation(line: 58, column: 23, scope: !85)
!90 = !DILocation(line: 60, column: 16, scope: !85)
!91 = !DILocation(line: 60, column: 22, scope: !85)
!92 = !DILocation(line: 60, column: 9, scope: !85)
!93 = !DILocation(line: 61, column: 19, scope: !85)
!94 = !DILocation(line: 61, column: 9, scope: !85)
!95 = !DILocation(line: 62, column: 14, scope: !85)
!96 = !DILocation(line: 62, column: 9, scope: !85)
!97 = !DILocation(line: 64, column: 1, scope: !70)
