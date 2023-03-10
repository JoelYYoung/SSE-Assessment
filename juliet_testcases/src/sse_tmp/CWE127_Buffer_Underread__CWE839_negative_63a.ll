; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_63a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_63_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 -1, i32* %data, align 4, !dbg !18
  store i32 -5, i32* %data, align 4, !dbg !19
  call void @CWE127_Buffer_Underread__CWE839_negative_63b_badSink(i32* %data), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_63b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_63_good() #0 !dbg !22 {
entry:
  call void @goodG2B(), !dbg !23
  call void @goodB2G(), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !34, metadata !DIExpression()), !dbg !35
  %call = call i64 @time(i64* null) #4, !dbg !36
  %conv = trunc i64 %call to i32, !dbg !37
  call void @srand(i32 %conv) #4, !dbg !38
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !39
  call void @CWE127_Buffer_Underread__CWE839_negative_63_good(), !dbg !40
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !41
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !42
  call void @CWE127_Buffer_Underread__CWE839_negative_63_bad(), !dbg !43
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !46 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 -1, i32* %data, align 4, !dbg !49
  store i32 7, i32* %data, align 4, !dbg !50
  call void @CWE127_Buffer_Underread__CWE839_negative_63b_goodG2BSink(i32* %data), !dbg !51
  ret void, !dbg !52
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_63b_goodG2BSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !53 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 -1, i32* %data, align 4, !dbg !56
  store i32 -5, i32* %data, align 4, !dbg !57
  call void @CWE127_Buffer_Underread__CWE839_negative_63b_goodB2GSink(i32* %data), !dbg !58
  ret void, !dbg !59
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_63b_goodB2GSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_63_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_63a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 27, column: 9, scope: !11)
!18 = !DILocation(line: 29, column: 10, scope: !11)
!19 = !DILocation(line: 31, column: 10, scope: !11)
!20 = !DILocation(line: 32, column: 5, scope: !11)
!21 = !DILocation(line: 33, column: 1, scope: !11)
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_63_good", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 68, column: 5, scope: !22)
!24 = !DILocation(line: 69, column: 5, scope: !22)
!25 = !DILocation(line: 70, column: 1, scope: !22)
!26 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 81, type: !27, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!16, !16, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!32 = !DILocalVariable(name: "argc", arg: 1, scope: !26, file: !12, line: 81, type: !16)
!33 = !DILocation(line: 81, column: 14, scope: !26)
!34 = !DILocalVariable(name: "argv", arg: 2, scope: !26, file: !12, line: 81, type: !29)
!35 = !DILocation(line: 81, column: 27, scope: !26)
!36 = !DILocation(line: 84, column: 22, scope: !26)
!37 = !DILocation(line: 84, column: 12, scope: !26)
!38 = !DILocation(line: 84, column: 5, scope: !26)
!39 = !DILocation(line: 86, column: 5, scope: !26)
!40 = !DILocation(line: 87, column: 5, scope: !26)
!41 = !DILocation(line: 88, column: 5, scope: !26)
!42 = !DILocation(line: 91, column: 5, scope: !26)
!43 = !DILocation(line: 92, column: 5, scope: !26)
!44 = !DILocation(line: 93, column: 5, scope: !26)
!45 = !DILocation(line: 95, column: 5, scope: !26)
!46 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 44, type: !16)
!48 = !DILocation(line: 44, column: 9, scope: !46)
!49 = !DILocation(line: 46, column: 10, scope: !46)
!50 = !DILocation(line: 49, column: 10, scope: !46)
!51 = !DILocation(line: 50, column: 5, scope: !46)
!52 = !DILocation(line: 51, column: 1, scope: !46)
!53 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", scope: !53, file: !12, line: 58, type: !16)
!55 = !DILocation(line: 58, column: 9, scope: !53)
!56 = !DILocation(line: 60, column: 10, scope: !53)
!57 = !DILocation(line: 62, column: 10, scope: !53)
!58 = !DILocation(line: 63, column: 5, scope: !53)
!59 = !DILocation(line: 64, column: 1, scope: !53)
