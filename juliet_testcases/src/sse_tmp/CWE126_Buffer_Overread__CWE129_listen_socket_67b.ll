; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_67b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType = type { i32 }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_67b_badSink(i32 %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !22
  %0 = load i32, i32* %structFirst, align 4, !dbg !22
  store i32 %0, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !28
  %2 = load i32, i32* %data, align 4, !dbg !29
  %cmp = icmp sge i32 %2, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !33
  %idxprom = sext i32 %3 to i64, !dbg !35
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !35
  %4 = load i32, i32* %arrayidx, align 4, !dbg !35
  call void @printIntLine(i32 %4), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_67b_goodG2BSink(i32 %myStruct.coerce) #0 !dbg !41 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %data, metadata !44, metadata !DIExpression()), !dbg !45
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !46
  %0 = load i32, i32* %structFirst, align 4, !dbg !46
  store i32 %0, i32* %data, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !47, metadata !DIExpression()), !dbg !49
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !49
  %2 = load i32, i32* %data, align 4, !dbg !50
  %cmp = icmp sge i32 %2, 0, !dbg !52
  br i1 %cmp, label %if.then, label %if.else, !dbg !53

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !54
  %idxprom = sext i32 %3 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  %4 = load i32, i32* %arrayidx, align 4, !dbg !56
  call void @printIntLine(i32 %4), !dbg !57
  br label %if.end, !dbg !58

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_67b_goodB2GSink(i32 %myStruct.coerce) #0 !dbg !62 {
entry:
  %myStruct = alloca %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !DIExpression()), !dbg !66
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType, %struct._CWE126_Buffer_Overread__CWE129_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !67
  %0 = load i32, i32* %structFirst, align 4, !dbg !67
  store i32 %0, i32* %data, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !68, metadata !DIExpression()), !dbg !70
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !70
  %2 = load i32, i32* %data, align 4, !dbg !71
  %cmp = icmp sge i32 %2, 0, !dbg !73
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !74

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !75
  %cmp1 = icmp slt i32 %3, 10, !dbg !76
  br i1 %cmp1, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !78
  %idxprom = sext i32 %4 to i64, !dbg !80
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !80
  %5 = load i32, i32* %arrayidx, align 4, !dbg !80
  call void @printIntLine(i32 %5), !dbg !81
  br label %if.end, !dbg !82

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !85
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_67b_badSink", scope: !10, file: !10, line: 49, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__CWE129_listen_socket_67_structType", file: !10, line: 45, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE126_Buffer_Overread__CWE129_listen_socket_67_structType", file: !10, line: 42, size: 32, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 44, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 49, type: !13)
!19 = !DILocation(line: 49, column: 122, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 51, type: !17)
!21 = !DILocation(line: 51, column: 9, scope: !9)
!22 = !DILocation(line: 51, column: 25, scope: !9)
!23 = !DILocalVariable(name: "buffer", scope: !24, file: !10, line: 53, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 52, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 53, column: 13, scope: !24)
!29 = !DILocation(line: 56, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !10, line: 56, column: 13)
!31 = !DILocation(line: 56, column: 18, scope: !30)
!32 = !DILocation(line: 56, column: 13, scope: !24)
!33 = !DILocation(line: 58, column: 33, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 57, column: 9)
!35 = !DILocation(line: 58, column: 26, scope: !34)
!36 = !DILocation(line: 58, column: 13, scope: !34)
!37 = !DILocation(line: 59, column: 9, scope: !34)
!38 = !DILocation(line: 62, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !10, line: 61, column: 9)
!40 = !DILocation(line: 65, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_67b_goodG2BSink", scope: !10, file: !10, line: 72, type: !11, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "myStruct", arg: 1, scope: !41, file: !10, line: 72, type: !13)
!43 = !DILocation(line: 72, column: 126, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 74, type: !17)
!45 = !DILocation(line: 74, column: 9, scope: !41)
!46 = !DILocation(line: 74, column: 25, scope: !41)
!47 = !DILocalVariable(name: "buffer", scope: !48, file: !10, line: 76, type: !25)
!48 = distinct !DILexicalBlock(scope: !41, file: !10, line: 75, column: 5)
!49 = !DILocation(line: 76, column: 13, scope: !48)
!50 = !DILocation(line: 79, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 79, column: 13)
!52 = !DILocation(line: 79, column: 18, scope: !51)
!53 = !DILocation(line: 79, column: 13, scope: !48)
!54 = !DILocation(line: 81, column: 33, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 80, column: 9)
!56 = !DILocation(line: 81, column: 26, scope: !55)
!57 = !DILocation(line: 81, column: 13, scope: !55)
!58 = !DILocation(line: 82, column: 9, scope: !55)
!59 = !DILocation(line: 85, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !51, file: !10, line: 84, column: 9)
!61 = !DILocation(line: 88, column: 1, scope: !41)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_67b_goodB2GSink", scope: !10, file: !10, line: 91, type: !11, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "myStruct", arg: 1, scope: !62, file: !10, line: 91, type: !13)
!64 = !DILocation(line: 91, column: 126, scope: !62)
!65 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 93, type: !17)
!66 = !DILocation(line: 93, column: 9, scope: !62)
!67 = !DILocation(line: 93, column: 25, scope: !62)
!68 = !DILocalVariable(name: "buffer", scope: !69, file: !10, line: 95, type: !25)
!69 = distinct !DILexicalBlock(scope: !62, file: !10, line: 94, column: 5)
!70 = !DILocation(line: 95, column: 13, scope: !69)
!71 = !DILocation(line: 97, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 97, column: 13)
!73 = !DILocation(line: 97, column: 18, scope: !72)
!74 = !DILocation(line: 97, column: 23, scope: !72)
!75 = !DILocation(line: 97, column: 26, scope: !72)
!76 = !DILocation(line: 97, column: 31, scope: !72)
!77 = !DILocation(line: 97, column: 13, scope: !69)
!78 = !DILocation(line: 99, column: 33, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !10, line: 98, column: 9)
!80 = !DILocation(line: 99, column: 26, scope: !79)
!81 = !DILocation(line: 99, column: 13, scope: !79)
!82 = !DILocation(line: 100, column: 9, scope: !79)
!83 = !DILocation(line: 103, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !10, line: 102, column: 9)
!85 = !DILocation(line: 106, column: 1, scope: !62)
