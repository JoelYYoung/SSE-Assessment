; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_53a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_53a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53_bad() #0 !dbg !12 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !17
  store i8* null, i8** %data, align 8, !dbg !18
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_badSink(i8* %0), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53_good() #0 !dbg !23 {
entry:
  call void @goodG2B(), !dbg !24
  call void @goodB2G(), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !34, metadata !DIExpression()), !dbg !35
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %call = call i64 @time(i64* null) #4, !dbg !38
  %conv = trunc i64 %call to i32, !dbg !39
  call void @srand(i32 %conv) #4, !dbg !40
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !41
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53_good(), !dbg !42
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !43
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !44
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53_bad(), !dbg !45
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !46
  ret i32 0, !dbg !47
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !48 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !49, metadata !DIExpression()), !dbg !50
  store i8* null, i8** %data, align 8, !dbg !51
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !52
  %0 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_goodG2BSink(i8* %0), !dbg !54
  ret void, !dbg !55
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_goodG2BSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !56 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* null, i8** %data, align 8, !dbg !59
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !60
  %0 = load i8*, i8** %data, align 8, !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_goodB2GSink(i8* %0), !dbg !62
  ret void, !dbg !63
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_53b_goodB2GSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_53a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_53_bad", scope: !13, file: !13, line: 30, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_53a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 32, type: !4)
!17 = !DILocation(line: 32, column: 12, scope: !12)
!18 = !DILocation(line: 33, column: 10, scope: !12)
!19 = !DILocation(line: 35, column: 10, scope: !12)
!20 = !DILocation(line: 36, column: 60, scope: !12)
!21 = !DILocation(line: 36, column: 5, scope: !12)
!22 = !DILocation(line: 37, column: 1, scope: !12)
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_53_good", scope: !13, file: !13, line: 67, type: !14, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 69, column: 5, scope: !23)
!25 = !DILocation(line: 70, column: 5, scope: !23)
!26 = !DILocation(line: 71, column: 1, scope: !23)
!27 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 82, type: !28, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !30, !31}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !27, file: !13, line: 82, type: !30)
!35 = !DILocation(line: 82, column: 14, scope: !27)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !27, file: !13, line: 82, type: !31)
!37 = !DILocation(line: 82, column: 27, scope: !27)
!38 = !DILocation(line: 85, column: 22, scope: !27)
!39 = !DILocation(line: 85, column: 12, scope: !27)
!40 = !DILocation(line: 85, column: 5, scope: !27)
!41 = !DILocation(line: 87, column: 5, scope: !27)
!42 = !DILocation(line: 88, column: 5, scope: !27)
!43 = !DILocation(line: 89, column: 5, scope: !27)
!44 = !DILocation(line: 92, column: 5, scope: !27)
!45 = !DILocation(line: 93, column: 5, scope: !27)
!46 = !DILocation(line: 94, column: 5, scope: !27)
!47 = !DILocation(line: 96, column: 5, scope: !27)
!48 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 46, type: !14, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "data", scope: !48, file: !13, line: 48, type: !4)
!50 = !DILocation(line: 48, column: 12, scope: !48)
!51 = !DILocation(line: 49, column: 10, scope: !48)
!52 = !DILocation(line: 51, column: 10, scope: !48)
!53 = !DILocation(line: 52, column: 64, scope: !48)
!54 = !DILocation(line: 52, column: 5, scope: !48)
!55 = !DILocation(line: 53, column: 1, scope: !48)
!56 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 58, type: !14, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", scope: !56, file: !13, line: 60, type: !4)
!58 = !DILocation(line: 60, column: 12, scope: !56)
!59 = !DILocation(line: 61, column: 10, scope: !56)
!60 = !DILocation(line: 63, column: 10, scope: !56)
!61 = !DILocation(line: 64, column: 64, scope: !56)
!62 = !DILocation(line: 64, column: 5, scope: !56)
!63 = !DILocation(line: 65, column: 1, scope: !56)
