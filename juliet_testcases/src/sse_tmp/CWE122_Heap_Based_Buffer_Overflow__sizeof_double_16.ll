; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !22
  %0 = bitcast i8* %call to double*, !dbg !24
  store double* %0, double** %data, align 8, !dbg !25
  %1 = load double*, double** %data, align 8, !dbg !26
  %cmp = icmp eq double* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %while.body
  %2 = load double*, double** %data, align 8, !dbg !32
  store double 1.700000e+300, double* %2, align 8, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %if.end
  %3 = load double*, double** %data, align 8, !dbg !35
  %4 = load double, double* %3, align 8, !dbg !36
  call void @printDoubleLine(double %4), !dbg !37
  %5 = load double*, double** %data, align 8, !dbg !38
  %6 = bitcast double* %5 to i8*, !dbg !38
  call void @free(i8* %6) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printDoubleLine(double) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store double* null, double** %data, align 8, !dbg !68
  br label %while.body, !dbg !69

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !70
  %0 = bitcast i8* %call to double*, !dbg !72
  store double* %0, double** %data, align 8, !dbg !73
  %1 = load double*, double** %data, align 8, !dbg !74
  %cmp = icmp eq double* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %while.body
  %2 = load double*, double** %data, align 8, !dbg !80
  store double 1.700000e+300, double* %2, align 8, !dbg !81
  br label %while.end, !dbg !82

while.end:                                        ; preds = %if.end
  %3 = load double*, double** %data, align 8, !dbg !83
  %4 = load double, double* %3, align 8, !dbg !84
  call void @printDoubleLine(double %4), !dbg !85
  %5 = load double*, double** %data, align 8, !dbg !86
  %6 = bitcast double* %5 to i8*, !dbg !86
  call void @free(i8* %6) #5, !dbg !87
  ret void, !dbg !88
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 5, scope: !14)
!22 = !DILocation(line: 30, column: 26, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!24 = !DILocation(line: 30, column: 16, scope: !23)
!25 = !DILocation(line: 30, column: 14, scope: !23)
!26 = !DILocation(line: 31, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 13)
!28 = !DILocation(line: 31, column: 18, scope: !27)
!29 = !DILocation(line: 31, column: 13, scope: !23)
!30 = !DILocation(line: 31, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 27)
!32 = !DILocation(line: 32, column: 10, scope: !23)
!33 = !DILocation(line: 32, column: 15, scope: !23)
!34 = !DILocation(line: 33, column: 9, scope: !23)
!35 = !DILocation(line: 36, column: 22, scope: !14)
!36 = !DILocation(line: 36, column: 21, scope: !14)
!37 = !DILocation(line: 36, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 10, scope: !14)
!39 = !DILocation(line: 37, column: 5, scope: !14)
!40 = !DILocation(line: 38, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_16_good", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 65, column: 5, scope: !41)
!43 = !DILocation(line: 66, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 78, type: !45, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !15, line: 78, type: !47)
!52 = !DILocation(line: 78, column: 14, scope: !44)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !15, line: 78, type: !48)
!54 = !DILocation(line: 78, column: 27, scope: !44)
!55 = !DILocation(line: 81, column: 22, scope: !44)
!56 = !DILocation(line: 81, column: 12, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 83, column: 5, scope: !44)
!59 = !DILocation(line: 84, column: 5, scope: !44)
!60 = !DILocation(line: 85, column: 5, scope: !44)
!61 = !DILocation(line: 88, column: 5, scope: !44)
!62 = !DILocation(line: 89, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = !DILocation(line: 92, column: 5, scope: !44)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !15, line: 47, type: !4)
!67 = !DILocation(line: 47, column: 14, scope: !65)
!68 = !DILocation(line: 49, column: 10, scope: !65)
!69 = !DILocation(line: 50, column: 5, scope: !65)
!70 = !DILocation(line: 53, column: 26, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !15, line: 51, column: 5)
!72 = !DILocation(line: 53, column: 16, scope: !71)
!73 = !DILocation(line: 53, column: 14, scope: !71)
!74 = !DILocation(line: 54, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 54, column: 13)
!76 = !DILocation(line: 54, column: 18, scope: !75)
!77 = !DILocation(line: 54, column: 13, scope: !71)
!78 = !DILocation(line: 54, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 54, column: 27)
!80 = !DILocation(line: 55, column: 10, scope: !71)
!81 = !DILocation(line: 55, column: 15, scope: !71)
!82 = !DILocation(line: 56, column: 9, scope: !71)
!83 = !DILocation(line: 59, column: 22, scope: !65)
!84 = !DILocation(line: 59, column: 21, scope: !65)
!85 = !DILocation(line: 59, column: 5, scope: !65)
!86 = !DILocation(line: 60, column: 10, scope: !65)
!87 = !DILocation(line: 60, column: 5, scope: !65)
!88 = !DILocation(line: 61, column: 1, scope: !65)
