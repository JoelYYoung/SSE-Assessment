; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_badData, align 8, !dbg !34
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68b_badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #5, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #5, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = alloca i8, i64 100, align 16, !dbg !64
  store i8* %0, i8** %dataBuffer, align 8, !dbg !63
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  store i8* %1, i8** %data, align 8, !dbg !66
  %2 = load i8*, i8** %data, align 8, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !68
  %3 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %4 = load i8*, i8** %data, align 8, !dbg !71
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_goodG2BData, align 8, !dbg !72
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68b_goodG2BSink(), !dbg !73
  ret void, !dbg !74
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_badData", scope: !2, file: !12, line: 27, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_goodG2BData", scope: !2, file: !12, line: 28, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_bad", scope: !12, file: !12, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 12, scope: !19)
!26 = !DILocation(line: 38, column: 33, scope: !19)
!27 = !DILocation(line: 39, column: 12, scope: !19)
!28 = !DILocation(line: 39, column: 10, scope: !19)
!29 = !DILocation(line: 41, column: 12, scope: !19)
!30 = !DILocation(line: 41, column: 5, scope: !19)
!31 = !DILocation(line: 42, column: 5, scope: !19)
!32 = !DILocation(line: 42, column: 17, scope: !19)
!33 = !DILocation(line: 43, column: 82, scope: !19)
!34 = !DILocation(line: 43, column: 80, scope: !19)
!35 = !DILocation(line: 44, column: 5, scope: !19)
!36 = !DILocation(line: 45, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_68_good", scope: !12, file: !12, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DILocation(line: 69, column: 5, scope: !37)
!39 = !DILocation(line: 70, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !41, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !12, line: 82, type: !43)
!46 = !DILocation(line: 82, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !12, line: 82, type: !44)
!48 = !DILocation(line: 82, column: 27, scope: !40)
!49 = !DILocation(line: 85, column: 22, scope: !40)
!50 = !DILocation(line: 85, column: 12, scope: !40)
!51 = !DILocation(line: 85, column: 5, scope: !40)
!52 = !DILocation(line: 87, column: 5, scope: !40)
!53 = !DILocation(line: 88, column: 5, scope: !40)
!54 = !DILocation(line: 89, column: 5, scope: !40)
!55 = !DILocation(line: 92, column: 5, scope: !40)
!56 = !DILocation(line: 93, column: 5, scope: !40)
!57 = !DILocation(line: 94, column: 5, scope: !40)
!58 = !DILocation(line: 96, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 57, type: !6)
!61 = !DILocation(line: 57, column: 12, scope: !59)
!62 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !12, line: 58, type: !6)
!63 = !DILocation(line: 58, column: 12, scope: !59)
!64 = !DILocation(line: 58, column: 33, scope: !59)
!65 = !DILocation(line: 59, column: 12, scope: !59)
!66 = !DILocation(line: 59, column: 10, scope: !59)
!67 = !DILocation(line: 61, column: 12, scope: !59)
!68 = !DILocation(line: 61, column: 5, scope: !59)
!69 = !DILocation(line: 62, column: 5, scope: !59)
!70 = !DILocation(line: 62, column: 16, scope: !59)
!71 = !DILocation(line: 63, column: 86, scope: !59)
!72 = !DILocation(line: 63, column: 84, scope: !59)
!73 = !DILocation(line: 64, column: 5, scope: !59)
!74 = !DILocation(line: 65, column: 1, scope: !59)
