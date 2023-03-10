; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !19
  store i8* %call, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61b_badSource(i8* %0), !dbg !22
  store i8* %call1, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #6, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* %4), !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* %5) #6, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61b_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #6, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #6, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !65
  store i8* %call, i8** %data, align 8, !dbg !66
  %0 = load i8*, i8** %data, align 8, !dbg !67
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61b_goodG2BSource(i8* %0), !dbg !68
  store i8* %call1, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !70, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !72
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !73
  %2 = load i8*, i8** %data, align 8, !dbg !74
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !76
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #6, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %4), !dbg !79
  %5 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* %5) #6, !dbg !81
  ret void, !dbg !82
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61b_goodG2BSource(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_bad", scope: !14, file: !14, line: 32, type: !15, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 34, type: !4)
!18 = !DILocation(line: 34, column: 12, scope: !13)
!19 = !DILocation(line: 35, column: 20, scope: !13)
!20 = !DILocation(line: 35, column: 10, scope: !13)
!21 = !DILocation(line: 36, column: 84, scope: !13)
!22 = !DILocation(line: 36, column: 12, scope: !13)
!23 = !DILocation(line: 36, column: 10, scope: !13)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !14, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 38, column: 14, scope: !25)
!30 = !DILocation(line: 40, column: 18, scope: !25)
!31 = !DILocation(line: 40, column: 31, scope: !25)
!32 = !DILocation(line: 40, column: 24, scope: !25)
!33 = !DILocation(line: 40, column: 44, scope: !25)
!34 = !DILocation(line: 40, column: 9, scope: !25)
!35 = !DILocation(line: 41, column: 19, scope: !25)
!36 = !DILocation(line: 41, column: 9, scope: !25)
!37 = !DILocation(line: 42, column: 14, scope: !25)
!38 = !DILocation(line: 42, column: 9, scope: !25)
!39 = !DILocation(line: 44, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_61_good", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 69, column: 5, scope: !40)
!42 = !DILocation(line: 70, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !44, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 82, type: !46)
!49 = !DILocation(line: 82, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 82, type: !47)
!51 = !DILocation(line: 82, column: 27, scope: !43)
!52 = !DILocation(line: 85, column: 22, scope: !43)
!53 = !DILocation(line: 85, column: 12, scope: !43)
!54 = !DILocation(line: 85, column: 5, scope: !43)
!55 = !DILocation(line: 87, column: 5, scope: !43)
!56 = !DILocation(line: 88, column: 5, scope: !43)
!57 = !DILocation(line: 89, column: 5, scope: !43)
!58 = !DILocation(line: 92, column: 5, scope: !43)
!59 = !DILocation(line: 93, column: 5, scope: !43)
!60 = !DILocation(line: 94, column: 5, scope: !43)
!61 = !DILocation(line: 96, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !14, line: 55, type: !4)
!64 = !DILocation(line: 55, column: 12, scope: !62)
!65 = !DILocation(line: 56, column: 20, scope: !62)
!66 = !DILocation(line: 56, column: 10, scope: !62)
!67 = !DILocation(line: 57, column: 88, scope: !62)
!68 = !DILocation(line: 57, column: 12, scope: !62)
!69 = !DILocation(line: 57, column: 10, scope: !62)
!70 = !DILocalVariable(name: "dest", scope: !71, file: !14, line: 59, type: !26)
!71 = distinct !DILexicalBlock(scope: !62, file: !14, line: 58, column: 5)
!72 = !DILocation(line: 59, column: 14, scope: !71)
!73 = !DILocation(line: 61, column: 18, scope: !71)
!74 = !DILocation(line: 61, column: 31, scope: !71)
!75 = !DILocation(line: 61, column: 24, scope: !71)
!76 = !DILocation(line: 61, column: 44, scope: !71)
!77 = !DILocation(line: 61, column: 9, scope: !71)
!78 = !DILocation(line: 62, column: 19, scope: !71)
!79 = !DILocation(line: 62, column: 9, scope: !71)
!80 = !DILocation(line: 63, column: 14, scope: !71)
!81 = !DILocation(line: 63, column: 9, scope: !71)
!82 = !DILocation(line: 65, column: 1, scope: !62)
