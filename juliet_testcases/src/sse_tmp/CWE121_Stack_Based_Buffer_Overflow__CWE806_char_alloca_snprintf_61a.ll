; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61b_badSource(i8* %2), !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %6), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_good() #0 !dbg !41 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #7, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #7, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = alloca i8, i64 100, align 16, !dbg !68
  store i8* %0, i8** %dataBuffer, align 8, !dbg !67
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  store i8* %1, i8** %data, align 8, !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61b_goodG2BSource(i8* %2), !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !74, metadata !DIExpression()), !dbg !76
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !79
  %5 = load i8*, i8** %data, align 8, !dbg !80
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !81
  %6 = load i8*, i8** %data, align 8, !dbg !82
  call void @printLine(i8* %6), !dbg !83
  ret void, !dbg !84
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_bad", scope: !14, file: !14, line: 32, type: !15, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 34, type: !4)
!18 = !DILocation(line: 34, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 35, type: !4)
!20 = !DILocation(line: 35, column: 12, scope: !13)
!21 = !DILocation(line: 35, column: 33, scope: !13)
!22 = !DILocation(line: 36, column: 12, scope: !13)
!23 = !DILocation(line: 36, column: 10, scope: !13)
!24 = !DILocation(line: 37, column: 90, scope: !13)
!25 = !DILocation(line: 37, column: 12, scope: !13)
!26 = !DILocation(line: 37, column: 10, scope: !13)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !14, line: 39, type: !29)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 39, column: 14, scope: !28)
!33 = !DILocation(line: 41, column: 18, scope: !28)
!34 = !DILocation(line: 41, column: 31, scope: !28)
!35 = !DILocation(line: 41, column: 24, scope: !28)
!36 = !DILocation(line: 41, column: 44, scope: !28)
!37 = !DILocation(line: 41, column: 9, scope: !28)
!38 = !DILocation(line: 42, column: 19, scope: !28)
!39 = !DILocation(line: 42, column: 9, scope: !28)
!40 = !DILocation(line: 44, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_61_good", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 69, column: 5, scope: !41)
!43 = !DILocation(line: 70, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !45, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 82, type: !47)
!50 = !DILocation(line: 82, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 82, type: !48)
!52 = !DILocation(line: 82, column: 27, scope: !44)
!53 = !DILocation(line: 85, column: 22, scope: !44)
!54 = !DILocation(line: 85, column: 12, scope: !44)
!55 = !DILocation(line: 85, column: 5, scope: !44)
!56 = !DILocation(line: 87, column: 5, scope: !44)
!57 = !DILocation(line: 88, column: 5, scope: !44)
!58 = !DILocation(line: 89, column: 5, scope: !44)
!59 = !DILocation(line: 92, column: 5, scope: !44)
!60 = !DILocation(line: 93, column: 5, scope: !44)
!61 = !DILocation(line: 94, column: 5, scope: !44)
!62 = !DILocation(line: 96, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 55, type: !4)
!65 = !DILocation(line: 55, column: 12, scope: !63)
!66 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !14, line: 56, type: !4)
!67 = !DILocation(line: 56, column: 12, scope: !63)
!68 = !DILocation(line: 56, column: 33, scope: !63)
!69 = !DILocation(line: 57, column: 12, scope: !63)
!70 = !DILocation(line: 57, column: 10, scope: !63)
!71 = !DILocation(line: 58, column: 94, scope: !63)
!72 = !DILocation(line: 58, column: 12, scope: !63)
!73 = !DILocation(line: 58, column: 10, scope: !63)
!74 = !DILocalVariable(name: "dest", scope: !75, file: !14, line: 60, type: !29)
!75 = distinct !DILexicalBlock(scope: !63, file: !14, line: 59, column: 5)
!76 = !DILocation(line: 60, column: 14, scope: !75)
!77 = !DILocation(line: 62, column: 18, scope: !75)
!78 = !DILocation(line: 62, column: 31, scope: !75)
!79 = !DILocation(line: 62, column: 24, scope: !75)
!80 = !DILocation(line: 62, column: 44, scope: !75)
!81 = !DILocation(line: 62, column: 9, scope: !75)
!82 = !DILocation(line: 63, column: 19, scope: !75)
!83 = !DILocation(line: 63, column: 9, scope: !75)
!84 = !DILocation(line: 65, column: 1, scope: !63)
