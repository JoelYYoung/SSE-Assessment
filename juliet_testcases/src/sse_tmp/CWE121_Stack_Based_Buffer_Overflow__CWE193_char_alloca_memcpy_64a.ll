; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = bitcast i8** %data to i8*, !dbg !29
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64b_badSink(i8* %4), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %call = call i64 @time(i64* null) #4, !dbg !44
  %conv = trunc i64 %call to i32, !dbg !45
  call void @srand(i32 %conv) #4, !dbg !46
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !47
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_good(), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_bad(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !54 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = alloca i8, i64 10, align 16, !dbg !59
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !60, metadata !DIExpression()), !dbg !61
  %1 = alloca i8, i64 11, align 16, !dbg !62
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !61
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !63
  store i8* %2, i8** %data, align 8, !dbg !64
  %3 = load i8*, i8** %data, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %4 = bitcast i8** %data to i8*, !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64b_goodG2BSink(i8* %4), !dbg !68
  ret void, !dbg !69
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 12, scope: !13)
!21 = !DILocation(line: 34, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 35, type: !4)
!23 = !DILocation(line: 35, column: 12, scope: !13)
!24 = !DILocation(line: 35, column: 37, scope: !13)
!25 = !DILocation(line: 38, column: 12, scope: !13)
!26 = !DILocation(line: 38, column: 10, scope: !13)
!27 = !DILocation(line: 39, column: 5, scope: !13)
!28 = !DILocation(line: 39, column: 13, scope: !13)
!29 = !DILocation(line: 40, column: 79, scope: !13)
!30 = !DILocation(line: 40, column: 5, scope: !13)
!31 = !DILocation(line: 41, column: 1, scope: !13)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_64_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 64, column: 5, scope: !32)
!34 = !DILocation(line: 65, column: 1, scope: !32)
!35 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !36, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !38, !39}
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !14, line: 77, type: !38)
!41 = !DILocation(line: 77, column: 14, scope: !35)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !14, line: 77, type: !39)
!43 = !DILocation(line: 77, column: 27, scope: !35)
!44 = !DILocation(line: 80, column: 22, scope: !35)
!45 = !DILocation(line: 80, column: 12, scope: !35)
!46 = !DILocation(line: 80, column: 5, scope: !35)
!47 = !DILocation(line: 82, column: 5, scope: !35)
!48 = !DILocation(line: 83, column: 5, scope: !35)
!49 = !DILocation(line: 84, column: 5, scope: !35)
!50 = !DILocation(line: 87, column: 5, scope: !35)
!51 = !DILocation(line: 88, column: 5, scope: !35)
!52 = !DILocation(line: 89, column: 5, scope: !35)
!53 = !DILocation(line: 91, column: 5, scope: !35)
!54 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !14, line: 52, type: !4)
!56 = !DILocation(line: 52, column: 12, scope: !54)
!57 = !DILocalVariable(name: "dataBadBuffer", scope: !54, file: !14, line: 53, type: !4)
!58 = !DILocation(line: 53, column: 12, scope: !54)
!59 = !DILocation(line: 53, column: 36, scope: !54)
!60 = !DILocalVariable(name: "dataGoodBuffer", scope: !54, file: !14, line: 54, type: !4)
!61 = !DILocation(line: 54, column: 12, scope: !54)
!62 = !DILocation(line: 54, column: 37, scope: !54)
!63 = !DILocation(line: 57, column: 12, scope: !54)
!64 = !DILocation(line: 57, column: 10, scope: !54)
!65 = !DILocation(line: 58, column: 5, scope: !54)
!66 = !DILocation(line: 58, column: 13, scope: !54)
!67 = !DILocation(line: 59, column: 83, scope: !54)
!68 = !DILocation(line: 59, column: 5, scope: !54)
!69 = !DILocation(line: 60, column: 1, scope: !54)
