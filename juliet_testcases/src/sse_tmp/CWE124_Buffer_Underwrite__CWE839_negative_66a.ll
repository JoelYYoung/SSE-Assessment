; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_66a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_66_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !18, metadata !DIExpression()), !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 -5, i32* %data, align 4, !dbg !24
  %0 = load i32, i32* %data, align 4, !dbg !25
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !26
  store i32 %0, i32* %arrayidx, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !28
  call void @CWE124_Buffer_Underwrite__CWE839_negative_66b_badSink(i32* %arraydecay), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_66b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_66_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  call void @goodB2G(), !dbg !33
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #4, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #4, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE124_Buffer_Underwrite__CWE839_negative_66_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE124_Buffer_Underwrite__CWE839_negative_66_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 -1, i32* %data, align 4, !dbg !60
  store i32 7, i32* %data, align 4, !dbg !61
  %0 = load i32, i32* %data, align 4, !dbg !62
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !63
  store i32 %0, i32* %arrayidx, align 8, !dbg !64
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !65
  call void @CWE124_Buffer_Underwrite__CWE839_negative_66b_goodG2BSink(i32* %arraydecay), !dbg !66
  ret void, !dbg !67
}

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_66b_goodG2BSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  store i32 -5, i32* %data, align 4, !dbg !74
  %0 = load i32, i32* %data, align 4, !dbg !75
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !76
  store i32 %0, i32* %arrayidx, align 8, !dbg !77
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !78
  call void @CWE124_Buffer_Underwrite__CWE839_negative_66b_goodB2GSink(i32* %arraydecay), !dbg !79
  ret void, !dbg !80
}

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_negative_66b_goodB2GSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_66a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_66_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_negative_66a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 27, column: 9, scope: !11)
!18 = !DILocalVariable(name: "dataArray", scope: !11, file: !12, line: 28, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 160, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 5)
!22 = !DILocation(line: 28, column: 9, scope: !11)
!23 = !DILocation(line: 30, column: 10, scope: !11)
!24 = !DILocation(line: 32, column: 10, scope: !11)
!25 = !DILocation(line: 34, column: 20, scope: !11)
!26 = !DILocation(line: 34, column: 5, scope: !11)
!27 = !DILocation(line: 34, column: 18, scope: !11)
!28 = !DILocation(line: 35, column: 59, scope: !11)
!29 = !DILocation(line: 35, column: 5, scope: !11)
!30 = !DILocation(line: 36, column: 1, scope: !11)
!31 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_negative_66_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 75, column: 5, scope: !31)
!33 = !DILocation(line: 76, column: 5, scope: !31)
!34 = !DILocation(line: 77, column: 1, scope: !31)
!35 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !36, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!16, !16, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !12, line: 88, type: !16)
!42 = !DILocation(line: 88, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !12, line: 88, type: !38)
!44 = !DILocation(line: 88, column: 27, scope: !35)
!45 = !DILocation(line: 91, column: 22, scope: !35)
!46 = !DILocation(line: 91, column: 12, scope: !35)
!47 = !DILocation(line: 91, column: 5, scope: !35)
!48 = !DILocation(line: 93, column: 5, scope: !35)
!49 = !DILocation(line: 94, column: 5, scope: !35)
!50 = !DILocation(line: 95, column: 5, scope: !35)
!51 = !DILocation(line: 98, column: 5, scope: !35)
!52 = !DILocation(line: 99, column: 5, scope: !35)
!53 = !DILocation(line: 100, column: 5, scope: !35)
!54 = !DILocation(line: 102, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 47, type: !16)
!57 = !DILocation(line: 47, column: 9, scope: !55)
!58 = !DILocalVariable(name: "dataArray", scope: !55, file: !12, line: 48, type: !19)
!59 = !DILocation(line: 48, column: 9, scope: !55)
!60 = !DILocation(line: 50, column: 10, scope: !55)
!61 = !DILocation(line: 53, column: 10, scope: !55)
!62 = !DILocation(line: 54, column: 20, scope: !55)
!63 = !DILocation(line: 54, column: 5, scope: !55)
!64 = !DILocation(line: 54, column: 18, scope: !55)
!65 = !DILocation(line: 55, column: 63, scope: !55)
!66 = !DILocation(line: 55, column: 5, scope: !55)
!67 = !DILocation(line: 56, column: 1, scope: !55)
!68 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 63, type: !16)
!70 = !DILocation(line: 63, column: 9, scope: !68)
!71 = !DILocalVariable(name: "dataArray", scope: !68, file: !12, line: 64, type: !19)
!72 = !DILocation(line: 64, column: 9, scope: !68)
!73 = !DILocation(line: 66, column: 10, scope: !68)
!74 = !DILocation(line: 68, column: 10, scope: !68)
!75 = !DILocation(line: 69, column: 20, scope: !68)
!76 = !DILocation(line: 69, column: 5, scope: !68)
!77 = !DILocation(line: 69, column: 18, scope: !68)
!78 = !DILocation(line: 70, column: 63, scope: !68)
!79 = !DILocation(line: 70, column: 5, scope: !68)
!80 = !DILocation(line: 71, column: 1, scope: !68)
